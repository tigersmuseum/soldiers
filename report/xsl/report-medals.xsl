<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">


<xsl:template match="source[.//soldiers:medal][1]" mode="medals">
	<h3><xsl:text>Medals</xsl:text></h3>
	<ul>
		<xsl:apply-templates select="..//soldiers:medal"/>
	</ul>
</xsl:template>

<xsl:template match="*" mode="medals"/>

<xsl:template match="soldiers:medal">
<li>
	<xsl:value-of select="@name"/>
	<xsl:apply-templates select="soldiers:clasp"/>
</li>
</xsl:template>

<xsl:template match="soldiers:clasp">
	<xsl:if test="not(preceding-sibling::soldiers:clasp)">
		<xsl:text> (</xsl:text>
	</xsl:if>
	<xsl:value-of select="."/>
	<xsl:choose>
		<xsl:when test="not(following-sibling::soldiers:clasp)">
			<xsl:text>)</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text>, </xsl:text>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
