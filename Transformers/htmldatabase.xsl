<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:strip-space elements="*" />
    <xsl:template match="/">
        <root>

            
        <xsl:for-each select="teiCorpus/TEI">
            <TEI>
            <id><xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/></id>
            <authority><xsl:value-of select="teiHeader/fileDesc/publicationStmt/authority"/></authority>
            <title><xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title"/></title>
            <pubPlace><xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/settlement"/>, <xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/region"/>, <xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/country"/></pubPlace>
            <date><xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/@when"/></date>
                <year><xsl:value-of select="substring(teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/@when,1,4)"/></year>
                <month><xsl:value-of select="substring(teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/@when,6,2)"/></month>
                <day><xsl:value-of select="substring(teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/@when,9,2)"/></day>
                <keywords>
                <xsl:for-each select="teiHeader/profileDesc/textClass/keywords/list/item">
                    <item><xsl:value-of select="."/></item>
                </xsl:for-each>
            </keywords>
            <xsl:copy-of select="text" />
            </TEI>
        </xsl:for-each></root>
    </xsl:template>
    
</xsl:stylesheet>