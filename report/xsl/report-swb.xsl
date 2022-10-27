<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">


<xsl:template match="soldiers:note[@source = 'Silver War Badge']" mode="medical"/>

<xsl:template match="soldiers:note[@source = 'Silver War Badge']" mode="swb">
	<h3><xsl:text><xsl:value-of select="@source"/></xsl:text></h3>
	<p class="note">
		<xsl:value-of select="."/>
	</p>
</xsl:template>


<xsl:template match="soldiers:note" mode="swb"/>

<xsl:template match="soldiers:death">
<p class="death">
	<xsl:text>Date of death: </xsl:text><xsl:value-of select="@date"/>
</p>
</xsl:template>

</xsl:stylesheet>
