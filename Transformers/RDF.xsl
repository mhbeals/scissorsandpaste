<?xml version="1.0" encoding="UTF-8"?>
	<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"><xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/><xsl:template match="teiCorpus"><xsl:result-document method="text" href="Outputs\RDF\SAPRDF.ttl">

@prefix cc: &lt;http://web.resource.org/cc/&gt; .
@prefix dc: &lt;http://purl.org/dc/terms/&gt; .
@prefix fabio: &lt;http://purl.org/spar/fabio/&gt; .
@prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
@prefix frbr: &lt;http://purl.org/spar/frbr/&gt; .
@prefix sap: &lt;http://www.scissorsandpaste.net/sapont#&gt; .
@prefix sapcorpus: &lt;http://www.scissorsandpaste.net/sapcorpus#&gt; .
@prefix sapmemes: &lt;http://www.scissorsandpaste.net/sapmemes#&gt; .
@prefix prism: &lt;http://prismstandard.org/namespaces/2.0/basic/&gt; .
@prefix pav: &lt;http://purl.org/pav/&gt; .
@prefix prov: &lt;http://www.w3.org/ns/prov#&gt; .
@prefix rdfs: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .

<!-- Standard Definitions -->sap:heading
	a prov:entity ; 
	rdfs:comment "declares the text of a newspaper article's heading or headline" .
	
sap:body
	a prov:entity ; 
	rdfs:comment "declares the text of a newspaper article's body or main text" ;
	rdfs:comment "All double quotation marks have been replaced by single inverted commas" .
	
sap:transcribedFrom
	rdfs:subPropertyOf pav:importedFrom ;
	rdfs:comment "declares that a new text transcription has been created from an imported image" ;
	rdfs:domain foaf:person ;
	rdfs:range fabio:WebManifestation .
	
sap:transcribedBy
	rdfs:subPropertyOf pav:importedBy ;
	rdfs:comment "declares who created a new text transcription from an imported image" ;
	rdfs:domain foaf:person ;
	rdfs:range fabio:WebManifestation .
		
sap:transcribedOn
	rdfs:subPropertyOf pav:importedOn ;
	rdfs:comment "declares when a new text transcription has been created from an imported image" ;
	rdfs:domain foaf:person ;
	rdfs:range dc:date .
		
sap:categorisedBy
	rdfs:subPropertyOf pav:contributedBy ;
	rdfs:comment "declares who assigned subject headings or coverage criteria to a transcription" ;
	rdfs:domain foaf:person ;
	rdfs:range foaf:Document .
		
sap:categorisedOn
	rdfs:subPropertyOf pav:contributedOn ;
	rdfs:comment "declares when subject headings or coverage criteria have been added to a transcription" ;
	rdfs:domain foaf:person ;
	rdfs:range dc:date .

<!-- Person --><xsl:for-each select="distinct-values(/teiCorpus/TEI/teiHeader/fileDesc/publicationStmt/authority/persName/@n)">
sap:<xsl:value-of select="."/> a foaf:person .
</xsl:for-each>
		
<!-- Meme --><xsl:for-each select="distinct-values(/teiCorpus/TEI/text/body/bibl[@type='original']/@corresp)">
sapmemes:<xsl:value-of select="."/> a fabio:NewsReport .
</xsl:for-each>
		
<!-- Title --><xsl:for-each select="document('../newspaperBibl.xml')/newspaperBibl/biblFull/titleStmt/title/@n">
sapcorpus:<xsl:value-of select="."/> 
			a fabio:Newspaper ;
			dc:title "<xsl:value-of select="../../title"/>" .			
</xsl:for-each>
		
<!-- Issue --><xsl:for-each select="document('../issuebibl.xml')/issueBibl/title/issue/@n">
sapcorpus:<xsl:value-of select="../../@n"/>_<xsl:value-of select="../date/@when"/> 
	a fabio:NewspaperIssue ;
	dc:date "<xsl:value-of select="../date/@when"/>"^^xsd:date ;
	fabio:partOf sapcorpus:<xsl:value-of select="../../@n"/> ;	
	pav:createdAt &lt;http://www.geonames.org/<xsl:value-of select="../pubPlace/address/settlement/@n"/>&gt; ; 
	pav:createdAt &lt;http://www.geonames.org/<xsl:value-of select="../pubPlace/address/region/@n"/>&gt; ;
	pav:createdAt &lt;http://www.geonames.org/<xsl:value-of select="../pubPlace/address/country/@n"/>&gt; .
</xsl:for-each>
		
<!-- Article --><xsl:for-each select="TEI">
sapcorpus:article_<xsl:value-of select="teiHeader/fileDesc/titleStmt/title/@n"/>
	a fabio:NewspaperArticle ;
	dc:date "<xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/@when"/>"^^xsd:date ;
	fabio:partOf sapcorpus:<xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title/@n"/>_<xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date/@when"/><xsl:if test="text/body/p[1]/pb/@n!=''"> ; 
	prism:startingPage "<xsl:value-of select="text/body/p[1]/pb[1]/@n"/>" </xsl:if><xsl:if test="text/body/bibl/@type='original'"> ;
	frbr:realizationOf sapmemes:<xsl:value-of select="text/body/bibl[1]/@corresp"/></xsl:if><xsl:if test="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/authority/ref/@target!=''"> ;
	frbr:embodiment &lt;<xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/authority/ref/@target"/>&gt; </xsl:if>.

<!-- Web/Physical Manifefstation of Article -->
<xsl:if test="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/authority/ref/@target!=''">
&lt;<xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/authority/ref/@target"/>&gt; 
	a fabio:WebManifestation ;
	frbr:embodimentOf sapcorpus:article_<xsl:value-of select="teiHeader/fileDesc/titleStmt/title/@n"/>.
</xsl:if>

<!-- Digital Image of Article -->
<xsl:if test="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/authority/ref/@target!=''">
sapcorpus:image_<xsl:value-of select="teiHeader/fileDesc/titleStmt/title/@n"/>
	a foaf:Document ;
	pav:retrievedFrom &lt;<xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/authority/ref/@target"/>&gt; ;
	pav:retrievedBy sap:<xsl:value-of select="teiHeader/fileDesc/publicationStmt/authority/persName[1]/@n"/> ;
	<xsl:if test="teiHeader/fileDesc/publicationStmt/authority/date[1]/@when!=''">pav:retrievedOn "<xsl:value-of select="teiHeader/fileDesc/publicationStmt/authority/date[1]/@when"/>"^^xsd:date ;</xsl:if>
	frbr:exemplarOf &lt;<xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/authority/ref/@target"/>&gt; ;
	fabio:isRepresentationOf sapcorpus:article_<xsl:value-of select="teiHeader/fileDesc/titleStmt/title/@n"/> ;
	fabio:isStoredOn fabio:HD .</xsl:if>
	
<!-- XML of Article -->&lt;http://www.scissorsandpaste.net/sapcorpus/<xsl:value-of select="teiHeader/fileDesc/titleStmt/title/@n"/>.xml&gt;
	a foaf:Document ;<xsl:if test="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/authority/ref/@target!=''">
	sap:transcribedFrom sapcorpus:image_<xsl:value-of select="teiHeader/fileDesc/titleStmt/title/@n"/> ;</xsl:if>		
	sap:transcribedBy sap:<xsl:value-of select="teiHeader/fileDesc/publicationStmt/authority/persName[2]/@n"/> ;<xsl:if test="teiHeader/fileDesc/publicationStmt/authority/date[2]/@when!=''">
	sap:transcribedOn "<xsl:value-of select="teiHeader/fileDesc/publicationStmt/authority/date[2]/@when"/>"^^xsd:date ;			<xsl:if test="teiHeader/fileDesc/publicationStmt/authority/persName[3] !=''">pav:catagorisedBy sap:<xsl:value-of select="teiHeader/fileDesc/publicationStmt/authority/persName[3]/@n"/> ;</xsl:if>
	sap:catagorisedOn "<xsl:value-of select="teiHeader/fileDesc/publicationStmt/authority/date[3]/@when"/>"^^xsd:date ;</xsl:if>
	cc:legalcode &lt;<xsl:value-of select="teiHeader/fileDesc/publicationStmt/availability/licence/@n"/>&gt; ;
	cc:attributionName "<xsl:value-of select="teiHeader/fileDesc/publicationStmt/authority/persName[2]"/>" ;
	cc:attributionURL &lt;http://www.scissorsandpaste.net&gt; ;<xsl:if test="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/authority/ref/@target!=''"> 
	frbr:exemplarOf &lt;<xsl:value-of select="teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/authority/ref/@target"/>&gt; ;</xsl:if>
	fabio:isRepresentationOf sapcorpus:article_<xsl:value-of select="teiHeader/fileDesc/titleStmt/title/@n"/> ;
	fabio:isStoredOn fabio:internet ;<xsl:for-each select="teiHeader/profileDesc/textClass/keywords/list/item"><xsl:if test="contains(@n,'sh')">
	dc:coverage &lt;http://id.loc.gov/authorities/subjects/<xsl:value-of select="@n"/>.html&gt; ;</xsl:if></xsl:for-each><xsl:if test="text/body/head/settlement != ''"><xsl:for-each select="text/body/head/settlement">
	dc:coverage &lt;http://www.geonames.org/<xsl:value-of select="@n"/>&gt; ;</xsl:for-each></xsl:if><xsl:if test="text/body/head/province != ''"><xsl:for-each select="text/body/head/province"> 
	dc:coverage &lt;http://www.geonames.org/<xsl:value-of select="@n"/>&gt; ;</xsl:for-each></xsl:if><xsl:if test="text/body/head/country != ''"><xsl:for-each select="text/body/head/country">&lt; 
	dc:coverage &lt;http://www.geonames.org/<xsl:value-of select="@n"/>&gt; ;</xsl:for-each></xsl:if><xsl:if test="text/body/head/hi != ''"><xsl:for-each select="text/body/head/hi/settlement"> 
	dc:coverage &lt;http://www.geonames.org/<xsl:value-of select="@n"/>&gt; ;</xsl:for-each></xsl:if><xsl:if test="text/body/head/hi != ''"><xsl:for-each select="text/body/head/hi/province"> 
	dc:coverage &lt;http://www.geonames.org/<xsl:value-of select="@n"/>&gt; ;</xsl:for-each></xsl:if><xsl:if test="text/body/head/hi != ''"><xsl:for-each select="text/body/head/hi/country"> 
	dc:coverage &lt;http://www.geonames.org/<xsl:value-of select="@n"/>&gt; ;</xsl:for-each></xsl:if><xsl:if test="text/body/p/settlement != ''"><xsl:for-each select="text/body/p/settlement"> 
	dc:coverage &lt;http://www.geonames.org/<xsl:value-of select="@n"/>&gt; ;</xsl:for-each></xsl:if><xsl:if test="text/body/p/province != ''"><xsl:for-each select="text/body/p/province"> 
	dc:coverage &lt;http://www.geonames.org/<xsl:value-of select="@n"/>&gt; ;</xsl:for-each></xsl:if><xsl:if test="text/body/p/country != ''"><xsl:for-each select="text/body/p/country"> 
	dc:coverage &lt;http://www.geonames.org/<xsl:value-of select="@n"/>&gt; ;</xsl:for-each></xsl:if><xsl:if test="text/body/p/hi != ''"><xsl:for-each select="text/body/p/hi/settlement"> 
	dc:coverage &lt;http://www.geonames.org/<xsl:value-of select="@n"/>&gt; ;</xsl:for-each></xsl:if><xsl:if test="text/body/p/hi != ''"><xsl:for-each select="text/body/p/hi/province"> 
	dc:coverage &lt;http://www.geonames.org/<xsl:value-of select="@n"/>&gt; ;</xsl:for-each></xsl:if><xsl:if test="text/body/p/hi != ''"><xsl:for-each select="text/body/p/hi/country"> 
	dc:coverage &lt;http://www.geonames.org/<xsl:value-of select="@n"/>&gt; ;</xsl:for-each></xsl:if><xsl:if test="text/body/head!=''">
	sap:heading "<xsl:value-of select="text/body/head"/>" ;</xsl:if>
	sap:body "<xsl:for-each select="text/body/p"><xsl:value-of select="replace(.,'&quot;',&apos;&apos;&apos;&apos;)"/><xsl:text>&#160;</xsl:text></xsl:for-each>" .
	</xsl:for-each>
	
	</xsl:result-document>
	</xsl:template>
</xsl:stylesheet>