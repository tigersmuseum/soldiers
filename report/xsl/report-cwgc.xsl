<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">


<xsl:template match="soldiers:note[@source = 'Commonwealth War Graves Commission']" mode="medical"/>

<xsl:template match="soldiers:note[@source = 'Commonwealth War Graves Commission']" mode="cwgc">
	<h3><xsl:text><xsl:value-of select="@source"/></xsl:text></h3>
	<p class="memorial">
		<xsl:text> Memorial: </xsl:text>
		<xsl:value-of select="soldiers:memorial/@country"/>
		<xsl:text>, </xsl:text>
		<xsl:value-of select="soldiers:memorial"/>
		<xsl:text> (ref: </xsl:text><xsl:value-of select="soldiers:memorial/@reference"/><xsl:text>)</xsl:text>
	</p>
	<xsl:apply-templates select="../soldiers:death"/>
</xsl:template>


<xsl:template match="soldiers:note" mode="cwgc"/>

<xsl:template match="soldiers:death">
<p class="death">
	<xsl:text>Date of death: </xsl:text><xsl:value-of select="@date"/>
</p>
</xsl:template>

</xsl:stylesheet>
