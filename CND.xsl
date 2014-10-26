<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:strip-space elements="*"/>
    <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <body>
                <p style="font-size:10px;text-align:center">
                    <a href="{license/@url}"><xsl:value-of select="root/metadata/license"/></a> by <xsl:value-of
                        select="root/metadata/author/@name"/> (<a
                        href="http://www.orcid.org/{root/metadata/author/@orcid}"><xsl:value-of
                            select="root/metadata/author/@orcid"/></a>). She can be contacted at <a
                        href="mailto:{root/metadata/author/@email}">
                        <xsl:value-of select="root/metadata/author/@email"/>
                    </a>
                </p>
                <xsl:for-each select="root/item">
                    <div style="background-color:teal;color:white;padding:4px;margin-bottom:1em;">
                        ID: <xsl:value-of select="id"/>
                    </div>
                    
                        <xsl:apply-templates select="publication_information"/>
                        <xsl:if test="p/pg/@n !=''"><b>Page: </b>
                        <xsl:for-each select="p/pg">
                            <xsl:value-of select="@n"/>
                            <xsl:if test="position() != last()">, </xsl:if>
                        </xsl:for-each>
                            <br/></xsl:if>
                        <xsl:if test="author/@name != ''">

                            <b>Author: </b>
                            <xsl:value-of select="author/@name"/>
                            <xsl:if test="author/@status != ''"> (<xsl:value-of
                                    select="author/@status"/>)</xsl:if>
                            <br/>

                        </xsl:if>

                        <xsl:if test="recipient/@name != ''">

                            <b>Recipient: </b>
                            <xsl:value-of select="recipient/@name"/>
                            <xsl:if test="recipient/@type != ''"> (<xsl:value-of
                                    select="recipient/@type"/>)</xsl:if>
                            <xsl:if test="recipient/@country != ''"> at <xsl:value-of
                                    select="recipient/@city"/>
                                <xsl:if test="recipient/@city != ''">, </xsl:if>
                                <xsl:value-of select="recipient/@province"/>
                                <xsl:if test="recipient/@province != ''">, </xsl:if>
                                <xsl:value-of select="recipient/@country"/>
                                <br/>
                            </xsl:if>
                            <br/>

                        </xsl:if>

                        <xsl:if test="p/dateline/@year != ''">
                            <b>Dateline(s): </b>
                            <ul>
                                <xsl:for-each select="p/dateline">
                                    <li>
                                        <xsl:if test="@day !=''"><xsl:value-of select="@day"
                                            />&#160;</xsl:if>
                                        <xsl:if test="@month !=''"><xsl:value-of select="@month"
                                            />&#160;</xsl:if>
                                        <xsl:if test="@year !=''">
                                            <xsl:value-of select="@year"/>,
                                        </xsl:if>
                                        <xsl:if test="@city !=''"><xsl:value-of select="@city"
                                            />,&#160;</xsl:if>
                                        <xsl:if test="@province !=''"><xsl:value-of
                                                select="@province"/>,&#160;</xsl:if>
                                        <xsl:if test="@country !=''">
                                            <xsl:value-of select="@country"/>
                                            <xsl:if test="@newspaper !=''">,&#160;</xsl:if>
                                        </xsl:if>
                                        <xsl:if test="@newspaper !=''">previously appearing in
                                                  <i><xsl:value-of select="@newspaper"/></i><xsl:if
                                                test="@international_transport !=''"
                                                >,&#160;</xsl:if></xsl:if>
                                        <xsl:if test="@international_transport !=''"> sent via the
                                                <xsl:value-of select="@international_transport"
                                            /></xsl:if>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </xsl:if>
                        <xsl:if test="p/line/dateline/@year != ''">
                            <b>Dateline(s): </b>
                            <ul>
                                <xsl:for-each select="p/line/dateline">
                                    <li>
                                        <xsl:if test="@day !=''"><xsl:value-of select="@day"
                                            />&#160;</xsl:if>
                                        <xsl:if test="@month !=''"><xsl:value-of select="@month"
                                            />&#160;</xsl:if>
                                        <xsl:if test="@year !=''">
                                            <xsl:value-of select="@year"/>
                                            <xsl:if test="@country !=''">,&#160;</xsl:if>
                                        </xsl:if>
                                        <xsl:if test="@city !=''"><xsl:value-of select="@city"
                                            />,&#160;</xsl:if>
                                        <xsl:if test="@province !=''"><xsl:value-of
                                                select="@province"/>,&#160;</xsl:if>
                                        <xsl:if test="@country !=''">
                                            <xsl:value-of select="@country"/>
                                            <xsl:if test="@newspaper !=''">,&#160;</xsl:if>
                                            <xsl:if test="@international_transport !=''"
                                                >,&#160;</xsl:if>
                                        </xsl:if>
                                        <xsl:if test="@newspaper !=''">previously appearing in
                                                  <i><xsl:value-of select="@newspaper"/></i><xsl:if
                                                test="@international_transport !=''"
                                                >,&#160;</xsl:if></xsl:if>
                                        <xsl:if test="@international_transport !=''">sent via the
                                                <xsl:value-of select="@international_transport"
                                            /></xsl:if>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </xsl:if>
                    
                    <div
                        style="background-color:#d3d3d3;padding:5px 5px 5px 5px;margin:10px 0 10px 0px">
                        <xsl:apply-templates select="p"/>
                    </div>
                    <xsl:if test="p/line/dateline/@year != ''">
                        
                            <xsl:if test="p/line/mention/@keyword !=''">
                                <b>Keywords:</b>
                                <ul>
                                    <xsl:for-each select="p/line/mention/@keyword">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </xsl:if>
                            <xsl:if test="p/line/mention/@name !=''">
                                <b>Persons Mentioned:</b>
                                <ul>
                                    <xsl:for-each select="p/line/mention/@name">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </xsl:if>
                            <xsl:if test="p/line/mention/@group !=''">
                                <b>Organisations Mentioned:</b>
                                <ul>
                                    <xsl:for-each select="p/line/mention/@group">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </xsl:if>
                            <xsl:if test="p/line/mention/@country !=''">
                                <b>Locations Mentioned:</b>
                                <ul>
                                    <xsl:for-each select="p/line/mention">
                                        <xsl:if test="@country !=''">
                                            <li>
                                                <xsl:if test="@city !=''"><xsl:value-of
                                                  select="@city"/>, </xsl:if>
                                                <xsl:if test="@province !=''"><xsl:value-of
                                                  select="@province"/>, </xsl:if>
                                                <xsl:value-of select="@country"/>
                                            </li>
                                        </xsl:if>
                                    </xsl:for-each>
                                </ul>
                            </xsl:if>
                        
                    </xsl:if>
                    
                        <xsl:if test="p/mention/@keyword !=''">
                            <b>Keywords:</b>
                            <ul>
                                <xsl:for-each select="p/mention/@keyword">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </xsl:if>
                        <xsl:if test="p/mention/@name !=''">
                            <b>Persons Mentioned:</b>
                            <ul>
                                <xsl:for-each select="p/mention/@name">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </xsl:if>
                        <xsl:if test="p/mention/@group !=''">
                            <b>Organisations Mentioned:</b>
                            <ul>
                                <xsl:for-each select="p/mention/@group">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </xsl:if>
                        <xsl:if test="p/mention/@country !=''">
                            <b>Locations Mentioned:</b>
                            <ul>
                                <xsl:for-each select="p/mention">
                                    <xsl:if test="@country !=''">
                                        <li>
                                            <xsl:if test="@city !=''"><xsl:value-of select="@city"
                                                />, </xsl:if>
                                            <xsl:if test="@province !=''"><xsl:value-of
                                                  select="@province"/>, </xsl:if>
                                            <xsl:value-of select="@country"/>
                                        </li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ul>
                        </xsl:if>
                    
                    <xsl:apply-templates select="transcription_information"/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="publication_information">
        <b>Newspaper: </b><xsl:value-of select="newspaper_title"/><br/>
        <b>Newspaper Location: </b><xsl:value-of select="newspaper_city"/>, <xsl:value-of
            select="newspaper_province"/>, <xsl:value-of select="newspaper_country"/><br/>
        <xsl:if test="year != ''"><b>Date: </b><xsl:value-of select="day"/> <xsl:value-of
                select="month"/> <xsl:value-of select="year"/><br/></xsl:if>
        <xsl:if test="section != ''">
            <b>Section: </b><xsl:value-of select="section_name"/><br/></xsl:if>
    </xsl:template>

    <xsl:template match="p"><p>
    <xsl:for-each select="line">
        <xsl:apply-templates/>
    </xsl:for-each></p>
    </xsl:template>

    <xsl:template match="line">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="hlb">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>

    <xsl:template match="center">
        <center><xsl:apply-templates/></center>

    </xsl:template>

    <xsl:template match="i">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>

    <xsl:template match="small_caps">
        <font style="text-transform:capitalize; font-variant:small-caps">
            <xsl:apply-templates/>
        </font>
    </xsl:template>
    <xsl:template match="missing">
        <font style="color:red">
            <xsl:apply-templates/>
        </font>
    </xsl:template>
    

    <xsl:template match="transcription_information">
        
            <b>Transcription Information: </b>
            <ul>
                <li>Collected <xsl:if test="collection_date != ''">on <xsl:value-of
                            select="collection_date"/></xsl:if> from a <xsl:value-of select="type"/>
                    <xsl:if test="repository != ''"> at <a style="color:black"
                            href="{url}"><xsl:value-of select="repository"/></a></xsl:if></li>
                <li>Transcribed <xsl:if test="transcription_date != ''">on <xsl:value-of
                            select="transcription_date"/></xsl:if> by <xsl:value-of
                        select="transcriber"/> (<xsl:value-of select="method"/>)</li>
            </ul>
        

    </xsl:template>

</xsl:stylesheet>
