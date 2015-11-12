<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="teiCorpus">
        <xsl:for-each-group select="TEI"
            group-by="teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title">
            <xsl:result-document method="xml"
                href="Outputs\XML\Title\{teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title}.xml">
                <teiCorpus>
                    <xsl:for-each select="current-group()">
                        <xsl:copy-of select="."/>
                    </xsl:for-each>
                </teiCorpus>
            </xsl:result-document>
        </xsl:for-each-group>
    </xsl:template>
</xsl:stylesheet>
