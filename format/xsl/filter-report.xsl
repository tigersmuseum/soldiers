<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">

<!-- 

	Report on number of soldiers in the input file (for reporting results of filtering)
 -->
 
<xsl:output method="text" encoding="UTF-8"/>

<xsl:param name="bucket"/>

<xsl:template match="/">
	<xsl:variable name="num" select="count(//soldiers:person)"/>
	<xsl:text>Number of </xsl:text><xsl:value-of select="$bucket"/><xsl:text>: </xsl:text><xsl:value-of select="$num"/>
</xsl:template>


</xsl:stylesheet>
