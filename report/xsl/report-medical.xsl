<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">

<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html>
<head><title>WINHR</title></head>
<body>
	<xsl:apply-templates select="//soldiers:person[position() &lt; 100]">
		<xsl:sort select="soldiers:surname"/>
		<xsl:sort select="soldiers:initials"/>
	</xsl:apply-templates>
</body>
</html>
</xsl:template>

<xsl:template match="soldiers:person">
	<article>
		<h2><xsl:value-of select="soldiers:surname"/><xsl:text>, </xsl:text><xsl:value-of select="soldiers:initials"/></h2>
		<xsl:apply-templates select="." mode="subtitle"/>
		<xsl:apply-templates select="." mode="dates"/>
		
		<h3>Medical Records</h3>
		<xsl:apply-templates select="soldiers:note" mode="medical"/>
		
	</article>
	
	<hr/>
	
</xsl:template>


<xsl:template match="soldiers:person" mode="subtitle">
<p>
	<xsl:apply-templates select="soldiers:service/soldiers:record[1]" mode="number"/>
	<xsl:value-of select="soldiers:service/soldiers:record[1]/@rank"/><xsl:text> </xsl:text>
	<xsl:apply-templates select="." mode="forenames"/>
	<xsl:value-of select="soldiers:surname"/>
</p>
</xsl:template>

<xsl:template match="soldiers:record[@number]" mode="number">
<xsl:value-of select="@number"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="soldiers:record" mode="number"/>


<xsl:template match="soldiers:person" mode="forenames">
	<xsl:choose>
		<xsl:when test="soldiers:forenames/text()">
			<xsl:value-of select="soldiers:forenames"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="soldiers:initials"/>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:text> </xsl:text>
</xsl:template>


<xsl:template match="soldiers:person" mode="dates">
<p>
	<xsl:apply-templates select="." mode="birthdate"/>
	<xsl:text> - </xsl:text>
	<xsl:apply-templates select="." mode="deathdate"/>
</p>
</xsl:template>

<xsl:template match="soldiers:person[soldiers:birth]" mode="birthdate">
	<xsl:text><xsl:value-of select="substring-before(soldiers:birth/@date, '-')"/></xsl:text>
</xsl:template>

<xsl:template match="soldiers:person" mode="birthdate">
	<xsl:text>?</xsl:text>
</xsl:template>

<xsl:template match="soldiers:person[soldiers:death]" mode="deathdate">
	<xsl:text><xsl:value-of select="substring-before(soldiers:death/@date, '-')"/></xsl:text>
</xsl:template>

<xsl:template match="soldiers:person" mode="deathdate">
<xsl:text>?</xsl:text>
</xsl:template>


<xsl:template match="soldiers:note" mode="medical">
<h4>
<xsl:apply-templates select="." mode="medicaldate"/>
<xsl:text> (</xsl:text><xsl:value-of select="@source"/><xsl:text>) </xsl:text>
</h4>
<xsl:apply-templates select="." mode="medicaltext"/>
</xsl:template>

<xsl:template match="soldiers:note[@date]" mode="medicaldate">
<span class="date"><xsl:value-of select="@date"/></span>
</xsl:template>

<xsl:template match="soldiers:note[soldiers:admission[@date]]" mode="medicaldate">
<span class="date"><xsl:value-of select="soldiers:admission/@date"/></span>
</xsl:template>

<xsl:template match="soldiers:note" mode="medicaldate">
<span class="date">no date</span>
</xsl:template>


<xsl:template match="soldiers:note[starts-with(@source, 'Casualty Ledger')]" mode="medicaltext">
<p><xsl:value-of select="."/>
<xsl:text> [</xsl:text><xsl:value-of select="concat('WINHR: ', @sourceref)"/><xsl:text>]</xsl:text>
</p>
</xsl:template>

<xsl:template match="soldiers:note[soldiers:admission]" mode="medicaltext">
<p><xsl:value-of select="soldiers:disease"/>
<xsl:text> [</xsl:text><xsl:value-of select="concat(@sourceref, ', no ', soldiers:admission/@number)"/><xsl:text>]</xsl:text>
</p>
</xsl:template>

<xsl:template match="soldiers:note" mode="medicaltext">
<p>TO DO</p>
</xsl:template>

</xsl:stylesheet>
