<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <xsl:result-document method="xml" href="Outputs\XML\Simplified\SimplifiedSAP.xml">
        <root>
            <xsl:for-each select="teiCorpus/TEI">
                <record>
                    <id>
                        <xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/>
                    </id>
                    <title>
                        <xsl:value-of
                            select="teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title"/>
                    </title>
                    <city>
                        <xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/settlement"/>
                    </city>
                    <province>
                        <xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/region"/>
                    </province>
                    <country>
                        <xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/country"/>
                    </country>
                    <date when="{teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/@when}">
                    <year>
                        <xsl:value-of select="substring(teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/@when, 1, 4)"/>
                    </year>
                    <month>
                        <xsl:value-of select="substring(teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/@when, 6, 2)"/>
                    </month>
                    <day>
                        <xsl:value-of select="substring(teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/@when, 9, 2)"/>
                    </day>
                    </date>
                    <keywords>
                        <xsl:for-each select="teiHeader/profileDesc/textClass/keywords/list/item">
                            <keyword>
                                <xsl:value-of select="."/>
                            </keyword>
                        </xsl:for-each>
                    </keywords>
                    <headline>
                        <xsl:value-of select="text/body/head"/>
                    </headline>
                    <text>
                    <xsl:for-each select="text/body/p">
                        <p><xsl:value-of select="."/></p>    
                    </xsl:for-each>
                    </text>
                </record>
            </xsl:for-each>
        </root>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
