<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:for-each-group select="teiCorpus/TEI/teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title/@n" group-by=".">
            <xsl:sort order="ascending"/>
            <title n="{.}">
                <xsl:for-each-group select="current-group()/ancestor::TEI[1]/teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/@when" group-by=".">
                    <xsl:sort order="ascending"/>
                    <issue n="{../../../titleStmt/title/@n}_{.}">
                        <xsl:copy-of select="../../../../biblFull/titleStmt/title"/>
                        <xsl:copy-of select="../../../../biblFull/publicationStmt/pubPlace"/>
                        <xsl:copy-of select="../../../../biblFull/publicationStmt/date"/>
                    </issue>
                </xsl:for-each-group>
            </title>
        </xsl:for-each-group>
    </xsl:template>
</xsl:stylesheet>
