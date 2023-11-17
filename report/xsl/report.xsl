<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">

<xsl:import href="report-header.xsl"/>
<xsl:import href="report-medical.xsl"/>
<xsl:import href="report-cwgc.xsl"/>
<xsl:import href="report-swb.xsl"/>
<xsl:import href="report-other.xsl"/>
<xsl:import href="report-medals.xsl"/>

<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html>
<head>
	<title>Biography</title>
	<style>
	footer {	
	 color: grey;
	 font-size: small;
	}
	.other {
		font-style: italic;
	}
	</style>
</head>
<body>
	<xsl:apply-templates select=".//bio"/>
</body>
</html>
</xsl:template>

<xsl:template match="bio">
	<article>
		<xsl:apply-templates select="database/soldiers:person[1]" mode="header"/>
		
		<xsl:apply-templates select=".//source" mode="medals"/>

 		<xsl:apply-templates select="." mode="medical"/>
		
		<xsl:apply-templates select=".//soldiers:note" mode="swb"/>

		<xsl:apply-templates select=".//soldiers:note[@source = 'Commonwealth War Graves Commission']" mode="cwgc"/>

		<xsl:apply-templates select=".//source" mode="other"/>

		<footer>
			<p><xsl:text>WINHR: SID/</xsl:text><xsl:value-of select="@sid"/></p>
			<p>Sources: <xsl:apply-templates select=".//source"/></p>
		</footer>
	</article>
	
	<hr/>
	
</xsl:template>


<xsl:template match="source">
	<xsl:value-of select="@name"/>
	<xsl:choose>
		<xsl:when test="following-sibling::source">
			<xsl:text>, </xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text>.</xsl:text>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


</xsl:stylesheet>
