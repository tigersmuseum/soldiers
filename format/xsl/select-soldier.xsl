<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">

<!-- 

	Collect together all the person elements from source files which have a candidate element for the SID supplied as the "sid" parameter.
	
	The input file for this transform is a list of source files to search. This has a 'source' element for each, with a 'file' attribute
	containing the URL of a file of Soldiers XML that has been annotated with candidate elements. Each source element an optional 'name'
	attribute. 
	
 -->

<xsl:output method="xml" encoding="UTF-8" indent="no"/>

<xsl:param name="sid"/>

<xsl:template match="/">
<bio sid="{$sid}">
	<xsl:apply-templates select="//source" />
</bio>
</xsl:template>

<xsl:template match="source">
	<xsl:message><xsl:value-of select="@name"/></xsl:message>
	<xsl:apply-templates select="document(@file)//soldiers:person[soldiers:candidate/@sid = $sid]" mode="copy">
		<xsl:with-param name="src" select="@name" />
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="soldiers:person" mode = "copy">
	<xsl:param name="src"/>
	<xsl:copy>
		<xsl:copy-of select="@*"/>
		<xsl:attribute name="src"><xsl:value-of select="$src"/></xsl:attribute>
		<xsl:copy-of select="*"/>
	</xsl:copy>
</xsl:template>

</xsl:stylesheet>
