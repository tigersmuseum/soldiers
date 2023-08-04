<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">

<xsl:template match="soldiers:person" mode="medical">
	<xsl:if test="soldiers:note[@type = 'medical' or starts-with(@source, 'Casualty Ledger') or starts-with(@source, 'Operation') or starts-with(@source, 'X')]">
		<h3>Medical Records</h3>
		<xsl:apply-templates select="soldiers:note" mode="medical"/>
	</xsl:if>
</xsl:template>


<xsl:template match="soldiers:note[@type = 'medical' or starts-with(@source, 'Casualty Ledger') or starts-with(@source, 'Operation') or starts-with(@source, 'X')]" mode="medical">
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

<xsl:template match="soldiers:note[soldiers:observations[@date]]" mode="medicaldate">
<span class="date"><xsl:value-of select="soldiers:observations/@date"/></span>
</xsl:template>

<xsl:template match="soldiers:note" mode="medicaldate">
<span class="date">no date</span>
</xsl:template>

<xsl:template match="soldiers:note" mode="medical"/>


<xsl:template match="soldiers:note[starts-with(@source, 'Casualty Ledger') or starts-with(@source, 'Operation') or starts-with(@source, 'X')]" mode="medicaltext">
<p><xsl:value-of select="."/>
<xsl:text> [</xsl:text><xsl:value-of select="concat('WINHR: ', @sourceref)"/><xsl:apply-templates select="@amot"/><xsl:text>]</xsl:text>
</p>
</xsl:template>

<xsl:template match="soldiers:note[soldiers:admission]" mode="medicaltext">
<p><xsl:value-of select="soldiers:disease"/>
<xsl:text> [</xsl:text><xsl:value-of select="concat(@sourceref, ', no ', soldiers:admission/@number)"/><xsl:text> - </xsl:text><xsl:value-of select="@unit"/><xsl:text>]</xsl:text>
</p>
</xsl:template>

<xsl:template match="soldiers:note[@source = 'War Office Casualty List']" mode="medicaltext">
<p><xsl:value-of select="."/></p>
</xsl:template>

<xsl:template match="soldiers:note" mode="medicaltext">
<p>TO DO</p>
</xsl:template>

<xsl:template match="@amot">
<xsl:text>, </xsl:text><a href="{concat('https://www.theogilbymuster.com/record/', substring-after(., '/'))}">Ogilby Muster</a>
</xsl:template>

</xsl:stylesheet>
