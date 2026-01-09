<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" exclude-result-prefixes="html office table text" version="1.0">

<!-- 
	Convert OpenDocument Text (.odt) to XHTML. This is the default document format for Open Office, and one of the "Save As" options in Microsoft Word.
	
	A .odt file is a Zip archive. This XSLT operates on the "content.xml" file extracted from the archive.
 -->

<xsl:output method="xml" indent="no" standalone="no"
	doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="office:document-content">
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
  	<xsl:apply-templates select="office:body"/>
  </html>
</xsl:template>

<xsl:template match="office:body">
	<body>
  		<xsl:apply-templates select="office:text"/>
	</body>
</xsl:template>

<xsl:template match="office:text">
	<xsl:apply-templates select="*"/>
</xsl:template>

<xsl:template match="text:h[@text:outline-level='1']">
	<h1><xsl:value-of select="."/></h1>
</xsl:template>

<xsl:template match="text:p">
	<xsl:element name="p">
		<xsl:apply-templates select="@text:style-name"/>
		<xsl:apply-templates select="*|text()"/>
	</xsl:element>
</xsl:template>

<xsl:template match="text:span">
	<xsl:element name="span">
		<xsl:apply-templates select="@text:style-name"/>
		<xsl:apply-templates select="*|text()"/>
	</xsl:element>
</xsl:template>

<xsl:template match="text:s">
	<xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="text:line-break">
	<br/>
</xsl:template>

<xsl:template match="text:tab">
	<!--  convert tab to 2 non-breaking spaces -->
	<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;]]></xsl:text>
</xsl:template>

<xsl:template match="text()">
		<xsl:value-of select="."/>
</xsl:template>

<xsl:template match="table:table">
	<table>
		<xsl:apply-templates select="table:table-row"/>
	</table>
</xsl:template>

<xsl:template match="table:table-row">
	<tr>
		<xsl:apply-templates select="table:table-cell"/>
	</tr>
</xsl:template>

<xsl:template match="table:table-cell">
	<xsl:element name="td">
		<xsl:apply-templates select="@table:number-columns-spanned"/>
		<xsl:apply-templates select="*"/>
	</xsl:element>
</xsl:template>

<xsl:template match="@text:style-name">
	<xsl:attribute name="class"><xsl:value-of select="."/></xsl:attribute>
</xsl:template>

<xsl:template match="@table:number-columns-spanned">
	<xsl:attribute name="colspan"><xsl:value-of select="."/></xsl:attribute>
</xsl:template>

<xsl:template match="*"/>

</xsl:stylesheet>
