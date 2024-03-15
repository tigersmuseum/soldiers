<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--
	Make a CSV file from an XML file of data sources.
 -->

<xsl:output method="text" encoding="UTF-8" />

<xsl:template match="/">
 <xsl:apply-templates select="//source"/>
</xsl:template>

<xsl:template match="source">
	<xsl:value-of select="@name"/>
	<xsl:text>,</xsl:text>
	<xsl:value-of select="@label"/>
	<xsl:text>,</xsl:text>
	<xsl:apply-templates select="@ref"/>
	<xsl:text>,</xsl:text>
	<xsl:apply-templates select="@file"/>
	<xsl:text>&#13;</xsl:text>
</xsl:template>

</xsl:stylesheet>
