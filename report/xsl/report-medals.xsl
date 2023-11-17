<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">


<xsl:template match="source[.//soldiers:medal]" mode="medals">
	<h3><xsl:text>Medals</xsl:text></h3>
	<xsl:apply-templates select=".//soldiers:medal"/>
</xsl:template>

<xsl:template match="*" mode="medals"/>

<xsl:template match="soldiers:medal">
	<xsl:value-of select="@name"/>
		<xsl:apply-templates select="soldiers:clasp"/>
</xsl:template>

<xsl:template match="soldiers:clasp">
	<xsl:choose>
		<xsl:when test="not(preceding-sibling::soldiers:clasp)">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="."/>
		</xsl:when>
		<xsl:when test="not(following-sibling::soldiers:clasp)">
			<xsl:value-of select="."/>
			<xsl:text>)</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="."/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
