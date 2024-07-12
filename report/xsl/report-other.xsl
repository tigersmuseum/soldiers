<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">


<xsl:template match="source[@name = 'CHARLIE']" mode="other">
<p class="other">
	Further details available from volunteer research into the &quot;Portsmouth Pals&quot; Battalions in WW1.
</p>
</xsl:template>

<xsl:template match="source[@name = 'ROGERS']" mode="other">
<p class="other">
	Further details available from volunteer research into the &quot;Old Contemptibles&quot; of WW1.
</p>
</xsl:template>

<xsl:template match="source[@name = 'TIGERTALK']" mode="other">
<p class="other">
	Mentioned in <xsl:value-of select=".//soldiers:note[1]/@sourceref"/>: <xsl:value-of select=".//soldiers:note[1]"/>.
</p>
</xsl:template>

<xsl:template match="source[@name = 'PROFILE']" mode="other">
<p class="other">
	Biographical research in file: <strong><xsl:value-of select=".//soldiers:note[1]/@filename"/></strong>.
</p>
</xsl:template>

<xsl:template match="source" mode="other"/>

</xsl:stylesheet>
