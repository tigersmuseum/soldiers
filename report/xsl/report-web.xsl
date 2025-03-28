<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">


<xsl:template match="source[contains(@name,'WEB')]" mode="web">
<p class="other">
	Links found on the internet:
	<ul>
		<xsl:apply-templates select=".//soldiers:note/*" mode="makelink"/>
	</ul>
</p>
</xsl:template>

<xsl:template match="*" mode="makelink">
	<li><a href="{@href}"><xsl:value-of select="@href"/></a></li>
</xsl:template>

<xsl:template match="source" mode="web"/>

</xsl:stylesheet>
