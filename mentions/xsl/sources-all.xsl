<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">

<!--
	Make a CSV file from an XML file of data sources.
 -->

<xsl:output method="text" encoding="UTF-8" />

<xsl:template match="/">
 <xsl:apply-templates select="//source"/>
</xsl:template>

<xsl:template match="source">
	<xsl:message><xsl:value-of select="@name"/>: <xsl:value-of select="count(document(@file)//soldiers:person)"/></xsl:message>
	<xsl:apply-templates select="document(@file)//soldiers:person">
		<xsl:with-param name="sourcekey" select="@name"/>
	</xsl:apply-templates>
</xsl:template>


<xsl:template match="soldiers:person[count(soldiers:candidate) = 1]">
	<xsl:param name="sourcekey"/>
	<xsl:value-of select="$sourcekey"/>
	<xsl:text>,</xsl:text>
	<xsl:value-of select="soldiers:candidate[1]/@sid"/>
	<xsl:text>,</xsl:text>
	<xsl:apply-templates select="soldiers:note[1]">
		<xsl:with-param name="sourcekey" select="$sourcekey"/>
	</xsl:apply-templates>
	<xsl:text>&#13;</xsl:text>
</xsl:template>

<xsl:template match="soldiers:person"/>

<xsl:template match="soldiers:note">
	<xsl:param name="sourcekey"/>
	<xsl:choose>
		<xsl:when test="$sourcekey = 'CWGC'">
			<xsl:value-of select="concat('cwgc:', substring-after(@sourceref, '/casualty-details/'))"/>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
