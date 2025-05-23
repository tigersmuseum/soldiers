<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="office table text draw xlink" >

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:template match="office:document-content">
<spreadsheet>
	<xsl:apply-templates select="office:body/office:spreadsheet"/>
</spreadsheet>
</xsl:template>


<xsl:template match="office:spreadsheet">
	<xsl:apply-templates select="table:table"/>
</xsl:template>


<xsl:template match="table:table">
<sheet name="{@table:name}">
	<xsl:apply-templates select="table:table-row"/>
</sheet>
</xsl:template>


<xsl:template match="table:table-row">
<row>
	<xsl:attribute name="number"><xsl:value-of select="position() + sum(preceding-sibling::table:table-row/@table:number-rows-repeated) - count(preceding-sibling::table:table-row/@table:number-rows-repeated)"/></xsl:attribute>
	<xsl:apply-templates select="@table:number-rows-repeated"/>
	<xsl:apply-templates select="table:table-cell"/>
</row>
</xsl:template>


<xsl:template match="table:table-cell">
<cell>
	<xsl:attribute name="index"><xsl:value-of select="position() + sum(preceding-sibling::table:table-cell/@table:number-columns-repeated) - count(preceding-sibling::table:table-cell/@table:number-columns-repeated)"/></xsl:attribute>
	<xsl:apply-templates select="@office:value-type"/>
	<xsl:apply-templates select="@table:number-columns-repeated"/>
	<xsl:apply-templates select="." mode="text"/>
	<xsl:apply-templates select=".//draw:image"/>
</cell>
</xsl:template>


<xsl:template match="@office:value-type[. = 'date']">
	<xsl:attribute name="date"><xsl:value-of select="../@office:date-value"/></xsl:attribute>
</xsl:template>

<xsl:template match="@office:value-type"/>

<xsl:template match="@table:number-columns-repeated">
	<xsl:attribute name="cols"><xsl:value-of select="."/></xsl:attribute>
</xsl:template>

<xsl:template match="@table:number-rows-repeated">
	<xsl:attribute name="rows"><xsl:value-of select="."/></xsl:attribute>
</xsl:template>

<xsl:template match="text:s" mode="text">
	<xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="*" mode="text">
	<xsl:apply-templates select="text()|*" mode="text"/>
</xsl:template>

<xsl:template match="text()" mode="text">
	<xsl:value-of select="."/>
</xsl:template>

<xsl:template match="draw:image[@xlink:href]">
	<image href="{@xlink:href}"/>
</xsl:template>

</xsl:stylesheet>

