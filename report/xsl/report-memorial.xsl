<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">


<xsl:template match="source[contains(@name,'MEMORIAL')]" mode="warmemorial">
<p class="other">
	Recorded on war memorial:
	<ul>
		<xsl:apply-templates select=".//soldiers:note" mode="memoriallink"/>
	</ul>
</p>
</xsl:template>

<xsl:template match="*" mode="memoriallink">
	<li><a href="{concat('https://www.iwm.org.uk/memorials/item/memorial/', substring-after(@src, 'WMR-'))}"><xsl:value-of select="@src"/> (IWM)</a></li>
</xsl:template>

<xsl:template match="source" mode="warmemorial"/>

</xsl:stylesheet>
