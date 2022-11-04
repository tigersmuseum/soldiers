<?xml version="1.0"?>
<xsl:stylesheet  xmlns="http://royalhampshireregiment.org/soldiers" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- 
	Reformat a spreadsheet of data downloaded from the CWGC Find War Dead site as Soldiers XML.
 -->
 
<xsl:output method="xml" indent="no"/>

<xsl:template match="/">
  <list source="{spreadsheet/sheet[1]/@name}">
    <xsl:apply-templates select="//row"/>
  </list>
</xsl:template>

<xsl:template match="row">
<person>
	<surname><xsl:value-of select="cell[@col = 'Surname']"/></surname>
	<forenames><xsl:value-of select="cell[@col = 'Forename']"/></forenames>
	<initials><xsl:value-of select="cell[@col = 'Initials']"/></initials>

	<service>
		<record rank="{cell[@col = 'Rank']}" regiment="{cell[@col = 'Regiment']}" before="{substring-before(cell[@col = 'DateOfDeath']/@date, 'T')}">
			<xsl:apply-templates select="cell[@col = 'ServiceNumber']"/>
		</record>
	</service>

	<death date="{substring-before(cell[@col = 'DateOfDeath']/@date, 'T')}"/>

	<note source="Commonwealth War Graves Commission" sourceref="{concat('https://www.cwgc.org/find-records/find-war-dead/casualty-details/', cell[@col = 'Id'])}">
		<xsl:apply-templates select="cell[@col = 'AgeAtDeath']"/>
		<memorial reference="{cell[@col = 'GraveRef']}" country="{cell[@col = 'Burial']}"><xsl:value-of select="cell[@col = 'Cemetery']"/></memorial>
		<xsl:apply-templates select="cell[@col = 'honours']"/>
		<xsl:apply-templates select="cell[@col = 'AdditionalInfo']"/>
	</note>
</person>
</xsl:template>

<xsl:template match="cell[@col = 'AdditionalInfo']">
	<xsl:variable name="text" select="normalize-space(.)"/>
	<xsl:if test="string-length($text) &gt; 0">
	<additional><xsl:value-of select="normalize-space(.)"/></additional>
	</xsl:if>
</xsl:template>

<xsl:template match="cell[@col = 'honours']">
	<honours_awards><xsl:value-of select="."/></honours_awards>
</xsl:template>

<xsl:template match="cell[@col = 'AgeAtDeath']">
	<xsl:if test="number(.) &gt; 0">
		<aged><xsl:value-of select="."/></aged>
	</xsl:if>
</xsl:template>

<xsl:template match="cell[@col = 'ServiceNumber']">
	<xsl:variable name="apostrophe" select='"&apos;"'/>
	<xsl:variable name="number" select="translate(., $apostrophe, '')"/>
	<xsl:if test="string-length($number) &gt; 0">
		<xsl:attribute name="number"><xsl:value-of select="$number"/></xsl:attribute>
	</xsl:if>
</xsl:template>

<xsl:template match="row[not(cell/@index = '2')]"/>

</xsl:stylesheet>
