<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">

<!-- 

	Filter to select unidentified soldiers (no candidate element)
 -->
 
<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:template match="/|*|@*|comment()|processing-instruction()">
  <xsl:copy>
    <xsl:apply-templates select="*|@*|comment()|processing-instruction()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="soldiers:person[not(soldiers:candidate)]">
  <xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="soldiers:person"/>

</xsl:stylesheet>
