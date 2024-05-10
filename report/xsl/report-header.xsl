<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">

<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="soldiers:person" mode="header">
	<xsl:if test="@sid">
		<xsl:attribute name="id"><xsl:value-of select="@sid"/></xsl:attribute>
	</xsl:if>
	<h2><xsl:value-of select="soldiers:surname"/><xsl:text>, </xsl:text><xsl:value-of select="soldiers:initials"/></h2>
	<xsl:apply-templates select="." mode="subtitle"/>
	<xsl:apply-templates select="." mode="dates"/>	
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
	<xsl:choose>
			<xsl:when test="soldiers:birth/@date">
				<xsl:text><xsl:value-of select="substring-before(soldiers:birth/@date, '-')"/></xsl:text>
			</xsl:when>
			<xsl:when test="soldiers:birth/@before">
				<xsl:text><xsl:value-of select="substring-before(soldiers:birth/@before, '-')"/></xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>?</xsl:text>				
			</xsl:otherwise>
	</xsl:choose>
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

</xsl:stylesheet>
