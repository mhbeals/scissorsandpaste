<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
<xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*" />
    
<xsl:template match="teiCorpus">
    <xsl:for-each select="TEI">
<xsl:for-each select="text/body/p">
    <xsl:copy-of select="normalize-space(translate(lower-case(replace(.,'&#x2013;','--')), '.,', ''))" /></xsl:for-each></xsl:for-each>
</xsl:template>
</xsl:stylesheet>