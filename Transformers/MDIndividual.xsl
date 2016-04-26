<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="teiCorpus">
        <xsl:for-each select="TEI">
            <xsl:result-document method="text"
                href="Outputs\MD\Individual\{teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/@when}_{teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title}_{teiHeader/fileDesc/titleStmt/title}.md">
                <xsl:value-of select="text/body/head"/><xsl:text>&#xd;&#xd;</xsl:text>
            <xsl:apply-templates select="text/body/p"/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="hi[@rend='italic']">*<xsl:apply-templates/>*</xsl:template>
    <xsl:template match="p"><xsl:apply-templates/><xsl:text>&#xd;&#xd;</xsl:text></xsl:template>
</xsl:stylesheet>
