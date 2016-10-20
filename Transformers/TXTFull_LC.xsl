<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
<xsl:output method="text" version="2.0" encoding="Windows-1252" indent="yes"/>
    <xsl:strip-space elements="*" />
    
<xsl:template match="teiCorpus">
    <xsl:result-document method="text" href="Outputs\TXT\SAPText_LC.txt">
    <xsl:for-each select="TEI">
<xsl:for-each select="text/body/p">
    <xsl:copy-of select="normalize-space(translate(lower-case(replace(replace(replace(.,'&quot;',''),'&#x2013;',''),'([0-9]+)','')),'.,)-/;\:?!£$%(', ''))" /></xsl:for-each></xsl:for-each>
</xsl:result-document>
</xsl:template>
<xsl:template match="char[@rend='dash']">--</xsl:template>
</xsl:stylesheet>