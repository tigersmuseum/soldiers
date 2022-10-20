<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- 
	Assuming the first row is column names, add the relevant column name as an attribute on each cell.
 -->
 
<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:template match="/|*|@*|comment()|processing-instruction()|text()">
  <xsl:copy>
    <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="row[position() = 1]"/>

<xsl:template match="row[position() &gt; 1]">
	<xsl:copy>
		<xsl:copy-of select="@*"/>
	    <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()"/>
	</xsl:copy>
</xsl:template>

<xsl:template match="cell">
	<xsl:copy>
		<xsl:copy-of select="@*"/>
		<xsl:attribute name="col"><xsl:value-of select="translate(ancestor::sheet/row[1]/cell[current()/@index = ./@index], &quot; ()/.&apos;:@&quot;, '_')"/></xsl:attribute>
	    <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()"/>
	</xsl:copy>
</xsl:template>

</xsl:stylesheet>
