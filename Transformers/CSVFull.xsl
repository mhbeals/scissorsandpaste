<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
 
 <xsl:output method="text" version="4.0" encoding="UTF-8"/>
 
 <xsl:template match="teiCorpus">
  <xsl:result-document method="text" href="Outputs\CSV\TEISAP.csv">Article ID,Newspaper Title,Newspaper City,Newspaper Province,Newspaper Country,Year,Month,Day,Article Type,Text,Keywords<xsl:for-each select="TEI">
   ID<xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/>,<xsl:value-of
    select="teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title"/>,<xsl:value-of
     select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/settlement"/>,<xsl:value-of
      select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/region"/>,<xsl:value-of
       select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace/address/country"/>,<xsl:for-each 
        select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date"><xsl:value-of 
         select="substring(@when,1,4)"/>,<xsl:value-of select="substring(@when,6,2)"/>,<xsl:value-of 
          select="substring(@when,9,2)"/>,</xsl:for-each><xsl:value-of select="teiHeader/profileDesc/textDesc/purpose/@type"/>,<xsl:for-each 
           select="text/body/p"><xsl:value-of select="normalize-space(translate(.,'&quot;,',''))"/><xsl:text>&#160;</xsl:text></xsl:for-each>,<xsl:for-each
            select="teiHeader/profileDesc/textClass/keywords/list/item"><xsl:value-of select="."/><xsl:if test="position() != last()">;</xsl:if></xsl:for-each>
   <xsl:text>&#xd;</xsl:text>
  </xsl:for-each>  </xsl:result-document>   
  
 </xsl:template>
</xsl:stylesheet>
