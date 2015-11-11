<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <xsl:copy-of select="teiCorpus"/>
    </xsl:template>
    <xsl:template match="p/text()">
    <xsl:value-of select="normalize-space(.)" />
    </xsl:template>
</xsl:stylesheet>