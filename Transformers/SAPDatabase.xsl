<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="teiCorpus">
        <xsl:for-each select="TEI">
            <TEI>
                <id><xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/></id>
                <title><xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title"/></title>
                <pubPlace><xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/settlement"/>, <xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/region"/>, <xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/country"/></pubPlace>
                <date><xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/@when"/></date>
                <keywords><xsl:for-each select="teiHeader/profileDesc/textClass/keywords/list/item"><keyword><xsl:value-of select="."/></keyword></xsl:for-each></keywords>
                <text>
                    <p><xsl:value-of select="text/body/p/head"/></p>
                    <xsl:for-each select="text/body/p"><p><xsl:value-of select="."/></p></xsl:for-each>
                </text>
            </TEI>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>