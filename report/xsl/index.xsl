<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">

<xsl:import href="report-header.xsl"/>
<xsl:import href="report-medical.xsl"/>

<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html>
<head>
	<title>Medical (WW1)</title>
	<style>
	</style>
</head>
<body>
	<h1>Medical Records (WW1)</h1>
	<p>This is the index to collected WW1 medical records. The sources are the 1917-1919 Causualty Ledger, and the transcribed "Hospital Books" (Field Ambulance, CCS, and Hospital admission/discharge registers from TNA).</p>
	<table>
	<tr><th>Soldier ID</th><th></th><th></th></tr>
		<xsl:apply-templates select="//article"/>
	</table>
</body>
</html>
</xsl:template>

<xsl:template match="article">
<tr>
	<td><a href="{concat('report.html#', @id)}"><xsl:value-of select="@id"/></a></td>
	<td><xsl:value-of select="h2"/></td>
	<td><xsl:value-of select="p[1]"/></td>
</tr>
</xsl:template>

</xsl:stylesheet>
