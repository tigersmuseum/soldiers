<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" exclude-result-prefixes="html" version="1.0">

<!-- 
	Convert OpenDocument Text (.odt) to XHTML. This is the default document format for Open Office, and one of the "Save As" options in Microsoft Word.
	
	A .odt file is a Zip archive. This XSLT operates on the "content.xml" file extracted from the archive.
 -->

<xsl:output method="xml" indent="no"/>

<xsl:template match="office:document-content">
  <html:html>
  	<html:head>
  		<html:title>TESTING</html:title>
		<html:style type="text/css">
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
		</html:style>
  	</html:head>
  	<xsl:apply-templates select="office:body"/>
  </html:html>
</xsl:template>

<xsl:template match="office:body">
	<html:body>
  		<xsl:apply-templates select="office:text"/>
	</html:body>
</xsl:template>

<xsl:template match="office:text">
	<xsl:apply-templates select="*"/>
</xsl:template>

<xsl:template match="text:h[@text:outline-level='1']">
	<html:h1><xsl:value-of select="."/></html:h1>
</xsl:template>

<xsl:template match="text:p">
	<xsl:element name="html:p">
		<xsl:apply-templates select="@text:style-name"/>
		<xsl:apply-templates select="*|text()"/>
	</xsl:element>
</xsl:template>

<xsl:template match="text:span">
	<xsl:element name="html:span">
		<xsl:apply-templates select="@text:style-name"/>
		<xsl:apply-templates select="*|text()"/>
	</xsl:element>
</xsl:template>

<xsl:template match="text:s">
	<xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="text()">
		<xsl:value-of select="."/>
</xsl:template>

<xsl:template match="table:table">
	<html:table>
		<xsl:apply-templates select="table:table-row"/>
	</html:table>
</xsl:template>

<xsl:template match="table:table-row">
	<html:tr>
		<xsl:apply-templates select="table:table-cell"/>
	</html:tr>
</xsl:template>

<xsl:template match="table:table-cell">
	<html:td>
		<xsl:apply-templates select="*"/>
	</html:td>
</xsl:template>

<xsl:template match="@text:style-name">
	<xsl:attribute name="class"><xsl:value-of select="."/></xsl:attribute>
</xsl:template>

<xsl:template match="*"/>

</xsl:stylesheet>
