<?xml version="1.0"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="1.0">

<xsl:output method="xml" encoding="UTF-8" indent="no"/>

<xsl:template match="/">
  <html>
  	<head>
  		<title>TESTING</title>
		<style type="text/css">
		table, th, td {
			border: 1px solid;
			border-collapse: collapse;
		}
		td {
			vertical-align: top;
		}
		p.Table_20_Heading {
			font-weight: bold;
		}
		</style>
  	</head>
  	<xsl:apply-templates select="w:document"/>
  </html>
</xsl:template>

<xsl:template match="w:document">
 	<xsl:apply-templates select="w:body"/>
</xsl:template>

<xsl:template match="w:body">
<body>
 	<xsl:apply-templates select="*"/>
</body>
</xsl:template>

<xsl:template match="w:tbl">
<table>
 	<xsl:apply-templates select=".//w:tr"/>
</table>
</xsl:template>

<xsl:template match="w:tr">
<row>
	<xsl:attribute name="num"><xsl:value-of select="position()"/></xsl:attribute>
	<xsl:apply-templates select=".//w:shd[@w:val = 'clear'][@w:fill][1]" mode="fill"/>
  	<xsl:apply-templates select="w:tc"/>
</row>
</xsl:template>


<xsl:template match="w:tc">
<cell col="{position()}">
  	<xsl:apply-templates/>
</cell>
</xsl:template>


<xsl:template match="w:p">
	<p><xsl:apply-templates mode="text"/></p>
</xsl:template>

<xsl:template match="w:tcPr/w:vMerge[not(@w:val = 'restart')]">
	<xsl:apply-templates select="ancestor::w:tc[last()]" mode="repeat"/>
</xsl:template>

<xsl:template match="w:tr" mode="repeat">
	<xsl:param name="pos"/>
	<xsl:apply-templates select="w:tc[position() = $pos]" mode="repeat"/>
</xsl:template>

<xsl:template match="w:tc[w:tcPr/w:vMerge[@w:val = 'restart']]" mode="repeat">
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="w:tc[w:tcPr/w:vMerge[not(@w:val = 'restart')]]" mode="repeat">
	<xsl:apply-templates select="preceding::w:tr[1]" mode="repeat">
		<xsl:with-param name="pos" select="count(preceding-sibling::w:tc) + 1"/>
	</xsl:apply-templates>
</xsl:template>

<!--  -->

<xsl:template match="w:r[.//w:color][w:t]" mode="text">
	<span style="{concat('color:#', .//w:color[1]/@w:val)}"><xsl:apply-templates mode="text"/></span>
</xsl:template>

<xsl:template match="w:r[.//w:strike][w:t]" mode="text">
	<span style="text-decoration: line-through"><xsl:apply-templates mode="text"/></span>
</xsl:template>

<xsl:template match="w:r[w:rPr/w:vertAlign/@w:val=&quot;superscript&quot;]" mode="text">
<sup><xsl:apply-templates mode="text"/></sup>
</xsl:template>

<xsl:template match="w:br" mode="text">
<br/>
</xsl:template>


<xsl:template match="*" mode="text">
	<xsl:apply-templates mode="text"/>
</xsl:template>

<xsl:template match="w:t" mode="text">
	<xsl:value-of select="."/>
</xsl:template>

<xsl:template match="text()" mode="text">
	<!--  ignore -->
</xsl:template>

<xsl:template match="w:shd" mode="fill">
	<xsl:attribute name="style"><xsl:value-of select="concat('background:#', @w:fill)"/></xsl:attribute>
</xsl:template>

</xsl:stylesheet>
