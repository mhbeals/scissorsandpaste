<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*" />
    <xsl:template match="/">
        <root>
            
            <xsl:for-each select="root/TEI">
                <TEI>
                    <xsl:copy-of select="id"/>
                    <xsl:copy-of select="authority"/>
                    <xsl:copy-of select="title"/>
                    <xsl:copy-of select="pubPlace"/>
                    <xsl:copy-of select="date"/>
                    <xsl:copy-of select="day"/>
                    <month>
                        <xsl:if test="month='01'"><xsl:value-of select="replace(month,'01','January')"/></xsl:if>
                        <xsl:if test="month='02'"><xsl:value-of select="replace(month,'02','February')"/></xsl:if>
                        <xsl:if test="month='03'"><xsl:value-of select="replace(month,'03','March')"/></xsl:if>
                        <xsl:if test="month='04'"><xsl:value-of select="replace(month,'04','April')"/></xsl:if>
                        <xsl:if test="month='05'"><xsl:value-of select="replace(month,'05','May')"/></xsl:if>
                        <xsl:if test="month='06'"><xsl:value-of select="replace(month,'06','June')"/></xsl:if>
                        <xsl:if test="month='07'"><xsl:value-of select="replace(month,'07','July')"/></xsl:if>
                        <xsl:if test="month='08'"><xsl:value-of select="replace(month,'08','August')"/></xsl:if>
                        <xsl:if test="month='09'"><xsl:value-of select="replace(month,'09','September')"/></xsl:if>
                        <xsl:if test="month='10'"><xsl:value-of select="replace(month,'10','October')"/></xsl:if>
                        <xsl:if test="month='11'"><xsl:value-of select="replace(month,'11','November')"/></xsl:if>
                        <xsl:if test="month='12'"><xsl:value-of select="replace(month,'12','December')"/></xsl:if>
                    </month>
                    <xsl:copy-of select="year"/>
                    <xsl:copy-of select="keywords"/>
                    <header><xsl:value-of select="translate(header,'.',' ')"/>...</header>
                    <text>
                        <xsl:for-each select="text/body/p">
                            <p>
                                <xsl:if test="pb/@n!=''"><pb n="{pb/@n}"/></xsl:if>
                                <xsl:apply-templates select="."/></p>
                        </xsl:for-each>
                    </text>
                </TEI>
            </xsl:for-each>
        </root>
    </xsl:template>
    <xsl:template match="hi[@rend='smallcaps']">
        <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text><font style="font-variant: small-caps;">
            <xsl:value-of select="."/></font><xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
    </xsl:template>
    <xsl:template match="hi[@rend='center']">
        <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text><center><xsl:value-of select="."/></center><xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
    </xsl:template>
    
    <xsl:template match="hi[@rend='italic']">
        <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text><i><xsl:value-of select="."/></i><xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
    </xsl:template>
</xsl:stylesheet>


