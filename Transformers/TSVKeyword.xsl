<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    
    <xsl:output method="text" version="4.0" encoding="UTF-8"/>
<xsl:template match="teiCorpus"><xsl:for-each-group select="TEI/teiHeader/profileDesc/textClass/keywords/list/item" group-by=".">
    <xsl:result-document method="text" href="Outputs\TSV\Keyword\{current-grouping-key()}.tsv">
        <xsl:text>Article ID &#x09;Newspaper Title &#x09;Newspaper City &#x09;Newspaper Province &#x09;Newspaper Country &#x09;Year &#x09;Month &#x09;Day &#x09;Article Type &#x09;Text&#xd;</xsl:text>
        <xsl:for-each select="current-group()/ancestor::TEI[1]">ID<xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/><xsl:text> &#x09;</xsl:text><xsl:value-of
            select="teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title"/><xsl:text> &#x09;</xsl:text><xsl:value-of
                select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/settlement"/><xsl:text> &#x09;</xsl:text><xsl:value-of
                    select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/region"/><xsl:text> &#x09;</xsl:text><xsl:value-of
                        select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/country"/><xsl:text> &#x09;</xsl:text><xsl:for-each 
                            select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date"><xsl:value-of 
                                select="substring(@when,1,4)"/><xsl:text> &#x09;</xsl:text><xsl:value-of select="substring(@when,6,2)"/><xsl:text> &#x09;</xsl:text><xsl:value-of 
                                    select="substring(@when,9,2)"/><xsl:text> &#x09;</xsl:text></xsl:for-each><xsl:value-of select="teiHeader/profileDesc/textDesc/purpose/@type"/><xsl:text> &#x09;</xsl:text><xsl:for-each 
                                        select="text/body/p"><xsl:value-of select="normalize-space(translate(.,'&quot;',''))"/><xsl:text>&#160;</xsl:text></xsl:for-each>
    <xsl:text> &#xd;</xsl:text>
    
</xsl:for-each>  </xsl:result-document></xsl:for-each-group>
    
    
    
</xsl:template>
</xsl:stylesheet>
