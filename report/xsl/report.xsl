<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soldiers="http://royalhampshireregiment.org/soldiers" version="1.0">

<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:import href="report-header.xsl"/>
<xsl:import href="report-medical.xsl"/>

<xsl:template match="/">
<html>
<head><title>WINHR</title></head>
<body>
	<xsl:apply-templates select="//soldiers:person[position() &lt; 400]">
		<xsl:sort select="soldiers:surname"/>
		<xsl:sort select="soldiers:initials"/>
	</xsl:apply-templates>
</body>
</html>
</xsl:template>

<xsl:template match="soldiers:person">
	<article>
		<xsl:apply-templates select="." mode="header"/>
		
		<h3>Medical Records</h3>
		<xsl:apply-templates select="soldiers:note" mode="medical"/>
		
	</article>
	
	<hr/>
	
</xsl:template>

</xsl:stylesheet>
