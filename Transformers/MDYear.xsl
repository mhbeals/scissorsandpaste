<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="teiCorpus">
        <xsl:for-each-group select="TEI" group-by="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/substring(@when,1,4)">
            <xsl:result-document method="text" href="Outputs\MD\Year\{teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/substring(@when,1,4)}.md">
                <xsl:for-each select="current-group()"><xsl:apply-templates select="text/body/p"/>
                      
---
</xsl:for-each>                
            </xsl:result-document>
        </xsl:for-each-group>

    </xsl:template>
    <xsl:template match="hi[@rend = 'italic']">*<xsl:apply-templates/>*</xsl:template>
    <xsl:template match="p">
        <xsl:apply-templates/>
        <xsl:text>&#xd;&#xd;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
