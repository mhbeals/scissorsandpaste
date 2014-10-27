# Purpose of Document #

This document describes the elements found in the Colonial Newspaper Database (CND)
and their usage when transcribing newspaper articles for inclusion within the database.

Each entry will include:  
Element name
1 Description
2 Usage
3 Required Attributes
3.1 Attribute 1
3.1.1 Attribute 2 Description
3.1.2 Usage
3.2 Attribute 2
3.2.1 Attribute 2 Description
3.2.2 Usage
4. Optional Attributes
4.1 Attribute 1
4.1.1 Attribute 2 Description
4.1.2 Usage
4.2 Attribute 2
4.2.1 Attribute 2 Description
4.2.2 Usage

Example of usage

# root

1. This is the root element for the CND.
2. Only used at start / end of database.
3. There are no permitted attributes.

<root></root>

## metadata

1. This contains the compiler and licensing information for the database.
2. Only used directly following <root> at the start of the database and must contain compiler and license information.
3. There are no permitted attributes.

<metadata></metadata>

### compiler

1. This is description of who the compiler of the database is.
2. Only used within the <metadata> element.
3. Required attributes 
3.1 email
3.1.1 Current contact email of compiler
3.1.2 email="m.beals@shu.ac.uk"
3.2 name
3.2.1 Name of compiler
3.2.2 name="M. H. Beals"
3.3 orcid
3.3.1 Orcid ID number of compiler
3.3.2 orcid="0000-0002-2907-3313"

<compiler orcid="0000-0002-2907-3313" email="mhbeals@mhbeals.com" name="M. H. Beals"/>

### license

1. This is the description of the license under which the database is made available.
2. Only used within the <metadata> element. Text is short, plain-text description of license.
3. Required attributes 
3.1 type
3.1.1 Short code of license type
3.1.2 type="CCBY"
3.2 version
3.2.1 Version of license
3.2.2 version="4.0"
3.3 url
3.3.1 Link to full legal code of license
3.3.2 url="https://creativecommons.org/licenses/by/4.0/legalcode"

 <license type="CCBY" version="4.0" url="https://creativecommons.org/licenses/by/4.0/legalcode">
 This work is licensed under a Creative Commons Attribution 4.0 International License
 </license>
         
## item

1. This contains the metadata and data of a single newspaper article.
2. Used to contain all elements related to a single newspaper article.
3. There are no permitted attributes.

<item></item>

### id

1. This contains the unique identifer code for a single newspaper article.
2. Only used directly following <item> at the start of the article entry. Text is a sequentially increasing integer. 
3. There are no permitted attributes.

<id>123</id>

### publication_information

1. This contains the metadata relating to the newspaper and issue in which the article was found.
2. Only used directly following <id> element. Must include:
2.1 newspaper_title
2.2 newspaper_city
2.3 newspaper_province
2.4 newspaper_country
2.5 year
2.6 month
2.7 day
2.8 section_name
3. There are no permitted attributes.

 <publication_information>
	<newspaper_title></newspaper_title>
	<newspaper_city></newspaper_city>
	<newspaper_province></newspaper_province>
	<newspaper_country></newspaper_country>
	<year></year>
	<month></month>
	<day></day>
	<section_name></section_name>
</publication_information>

#### newspaper_title
1. This contains the title of the publication in which the newspaper article appears.
2. Only used directly following <publication_information>. Text is a standardised version of the publication title. 
3. There are no permitted attributes.

<newspaper_title>Glasgow Advertiser</newspaper_title>

#### newspaper_city

1. This contains the city in which the publication was published.
2. Only used directly following the <newspaper_title> element. Text is the modern, standard British name for the city. 
3. There are no permitted attributes.

<newspaper_city>Glasgow</newspaper_city>

#### newspaper_province

1. This contains the province in which the publication was published.
2. Only used directly following the <newspaper_city> element. Text is the modern, standard British name for the province or state. 
   Home nations (England, Northern Ireland, Scotland, Wales) of the United Kingdom are treated as provinces.
3. There are no permitted attributes.

<newspaper_province>Scotland</newspaper_province>

#### newspaper_country

1. This contains the country in which the publication was published.
2. Only used directly following the <newspaper_province> element. Text is the modern, standard British name for the country. 
3. There are no permitted attributes.

<newspaper_country>United Kingdom</newspaper_country>

#### year

1. This contains the year in which the article was published.
2. Only used directly following the <newspaper_country> element. Text is the four-digit representation of the year. New style dates to be used. 
3. There are no permitted attributes.

<year>1789</year>

#### month

1. This contains the month in which the article was published.
2. Only used directly following the <year> element. Text is the full length English name of the month. 
3. There are no permitted attributes.

<month>July</month>
         
#### day

1. This contains the day on which the article was published.
2. Only used directly following the <month> element. Text is the one- or two-digit representation of the date.
3. There are no permitted attributes.

<day>1</day>

#### section_name

1. This contains the section heading under which the article was published. This is general represented through increased 
   font-size or heavier font-type. It may appear several columns or pages previously. It generally represents the location 
   from which the news was obtained. 
2. Only used directly following the <day> element. Text is the main heading text. Unclear section headings should be omitted. 
   Ending punctuation should be omitted.
3. There are no permitted attributes.

<section_name>America</section_name>

### articletype

1. This describes the type of article.
2. Only used directly following the </publication_information> element. Text is one of the four possible types:
2.1 News
2.1.1 Straightforward news content.
2.2 Letter
2.2.1 In which the vast majority or the entirety of the article is from a single piece of correspondence.
2.3 Miscellany
2.3.1 Non-time-sensitive material. Primarily jokes, anecdotes, and poems. 
2.4 Advertisement
2.4.1 Paid-for material advertising goods or services. Reprinted 'curious' advertisements should be classed as Miscellany.
3. There are no permitted attributes.

<articletype>News</articletype>

### p

1. This contains a paragraph or other typographically distinct sub-section. 
2. First instance immediately follows <articletype> element. May contain as many instances as necessary.
   Headings, datelines, and prefatory information to an article should be considered distinct paragraphs from the text that follows them.
   **May** contain the following elements:
2.1 pg
2.2 column
2.3 line
3. There are no permitted attributes.

<p>
<pg n="1">
<column/>
<line></line>
</p>

#### pg

1. This indicates a new page has begun between lines within the paragraph.
2. Must appear within a <p> element but outside any <line> element. First instance *must* appear directly following the first <p> element. 
   Subsequent instances should appear immediately following the <line> that appears at the bottom of a page, prior to any <column> element. 
   <pg> is always formatted as a closed element.
3. Required attributes:
3.1 n
3.2 Indicates the page on which the article appears. Text is a one or two-digit integer representing the page number. Publications without
    indicated page numbers are counted as physical 'sides'. 

<p>
<pg n="1">
<column/>
<line></line>
</p>

#### column

1. This indicates a new column has begun between lines within the paragraph.
2. Must appear within a <p> element but outside any <line> element. First instance *must* appear directly following the first <pg> element. 
   Subsequent instances should appear immediately preceding the <line> that appears at the top of a subsequent column or following any 
   subsequent <pg> element. <column> is always formatted as a closed element.
3. There are no permitted attributes.

<p>
<pg n="1"/>
<column/>
<line></line>
<column/>
<line></line>
<pg n="2"/>
<column/>
<line></line>
</p>

#### line

1. This contains a single line of text from the newspaper article, as printed within the original publication.
2. Must appear within a <p> element. First instance appears after the first <column> element. May include as many
   instances as required to represent the paragraph text.
3. There are no permitted attributes.

<p>
<pg n="1">
<column/>
<line></line>
</p>

#### hlb

1. This indicates that there is a hard line break in the text. It is used for non-paragraph forms, such as tables, in which 
   'running the lines together' in paragraph form during an XSL output would be detrimental to the visual representation of
   the text.
2. Must appear at the end of a line of text, directly following the </line> tag. <hlb> is always formatted at a closed element.
3. There are no permitted attributes.

<p>
<pg n="1">
<column/>
<line></line><hlb/>
</p>

#### Formatting Indicators

The following elements indicate the original formatting of the article text.  All formatting indicators must appear within a <line> element.
Any formatting that appears on multiple lines should be closed at the conclusion of a line (before the </line> tag) and repeated on the
subsequent line. Multiple formatting indicators should nest within each other the following order

+ Outermost
  + center
  + right
  
+ Inner
  + flush_right
  + i
  + small_caps
  + enlarged capital
  
+ Outside all other formatting indicators
  + sh
  + [space]

##### center

1. Indicates the line of text was centered within a column.
2. Should only be used for full-line centering. Placed immediately following open <line> tag. 

<line><center></center></line>

##### right

1. Indicates the line of text was right-justified within a column.
2. Should only be used for full-line right-justification. Placed immediately following open <line> tag. 

<line><right></right></line>

##### flush_right

1. Indicates the end of a line was right-justified. Used within <center> or <line> element.
2. Should only be used when end of line is right-justified, rather than full-line right-justification. 
   Placed immediately before </line> tag. 
    
<line><center>Initial text. <flush_right>Right text.</flush_right></center></line>
    
##### i

1. Indicates the original text was italicised.
2. Should not include final punctuation or trailing spaces.

<line><i>Extract of a letter</i>.</line>
    
##### small_caps

1. Indicates the use of a different set of metal type, allowing for Small Caps. 
2. Should include all letters of the word. If the first letter is larger than the remaining uppercase letters, this indicates it was an 
   uppercase letter within the Small Caps font type, and should be indicated as such. All other letters should be written in lower case.
   Should not include final punctuation or trailing spaces. 
    
<line><center><i><small_caps>America</small_caps> the beautiful</i>.</center></line>

##### enlarged_capital

1. Indicates the use of a different metal type, allowing for a single enlarged letter at the start of a line.
2. Should only include those letters that are printed in enlarged typeface, usually a single letter.  It should not include the final
   punctuation or trailing spaces. There should be no space immediately following the closing tag before the remaining letters of the 
   word, if any.
   
<line><center><i><enlarged_capital>A</enlarged_capital>nother Massacre</i>.</center></line>

##### missing
1. Indicates text is not legible in the copy currently being examined.
2. Should surround all text which is illegible, but not those characters where are visible, even if this means multiple tags within a single word. Text
   should be one ? for a missing character or ??? for a missing word.  Multiple words can be indicated missing within a single tag. If a word is obvious
   but technically obscured, it can be placed instead of ??? but should remain within missing tags to indicate this is an educated guess.
3. Required attributes
3.1 type
3.2 Indicates why the text is missing.  May be:
3.2.1 copy blur
3.2.2 copy folded
3.2.3 copy torn
3.2.4 copy hole

<line>Jack and Jill w<missing type="copy hole">ent</missing> up the hill to fetch a p<missing type="copy blur">???</missing> of water </line>

##### sh

1. Indicates the inclusion of a soft-hyphen.
2. Should be used *instead* of a soft-hyphen; a hyphen at the end of a line in a word that would not normally have a hyphen.
   Hyphens that would normally appear in the word should be maintained. Placed immediately before the closing </line> tag.
   
<line>The time has come for all good men to come to the aid of their coun<sh/></line>
<line>try.</line>

##### [space]

1. Indicates the space between the word at the end of one line and the beginning of another.
2. **All** lines which do not end in a soft-hyphen, or act as the final line in a paragraph <p>, must end with a space.

<p>
    <line>The time has come for all good men </line>
    <line>to come to the aid of their country.</line>
</p>

#### Entity Indicators

The following elements indicate an entity (person, place, thing) in article text.  All entity indicators must appear within a <line> element.
Any formatting that appears on multiple lines should surround the largest segment of the indicating text, whether this is on the first or second
line of a sentence. They can be nested within or around formatting indicators in whichever way best avoids overlapping elements. They should include
as much of the immediately relevant text as possible, but avoid final punctuation and exclude trailing spaces, except where overlapping would occur. 

##### mention

1. Indicates a person, place or thing is mentioned, or a concept alluded to, in the text.
2. Mentions should surround the noun that either states or alludes to the person, place or thing. If a single word could indicate two of the same
   mention attribute type, nest multiple copies of the mention element. 
3 There are no required attributes. Use optional attributes as relevant.
4. Optional Attributes
4.1 city
4.1.1 Attribute text is the modern, standard British name for the city. If unincorporated land or no longer exists, omit. Place in same tag as 
      province and country, based on modern political designations, regardless if these are explicitly mentioned.
4.1.2 <line>We arrived in <mention city="Glasgow" province="Scotland" country="United Kingdom">this place</mention> last week.<line>
4.2 province
4.2.1 Attribute text is the modern, standard British name for the province or state. Place in same tag as country, based on modern political 
      designations, regardless if this is explicitly mentioned.
4.2.2 <line>We arrived in <mention province="Scotland" country="United Kingdom">this place</mention> last week.<line>
4.3 country
4.3.1 Attribute text is the modern, standard British name for the country.
4.3.2 <line>We arrived in <mention country="United Kingdom">this place</mention> last week.<line>
4.4 name
4.4.1 Attribute text is the standard name of a person mentioned in the text. Last-name-first. Place in same tag as dates, if known.
4.4.2 <line>We have yet to hear from <mention name="Wayne, Anthony" dates="1 January 1745-15 December 1796">General Wayne</mention>.</line>
4.5 dates
4.5.1 Attribute text is the accepted date range for a person mentioned in the text. DD Month YYYY-DD Month YYYY. Unknown dates and months 
      should be omitted. Unknown year should be indicated with a ?. Must be used in conjunction with name attribute.
4.5.2 <line>We have yet to hear from <mention name="Wayne, Anthony" dates="?-1796">General Wayne</mention>.</line>
4.6 group
4.6.1 Attribute text is the accepted name for a group or organisation.
4.6.2 <line>There was a meeting of the <mention group="Society of Friends">Quakers</mention> in London </line> 
4.7 place
4.7.1 Attribute text is the accepted name for a landmark.
4.7.2 <line><mention place="College of William and Mary">College of William and Mary</mention>, in 
      <mention country="United States">New England</mention>, </line>
4.8 keyword
4.8.1 Attribute text is a concept or topic from a standardised list. Each keyword must be a separate element tag.
4.8.2 <line>for spreading the Christian <mention keyword="religion">religion</mention> amongst the 
      <mention keyword="Native Americans">Indians</mention> in the back settlements.</line>
    
##### dateline
1.
2.
3. There are no required attributes but you must include at least one optional attribute.
4. Optional Attributes
4.1 city
4.2 province
4.3 country
4.4 day
4.5 month
4.6 year
4.7 newspaper
4.8 international_transport
    
##### author

1.
2.
3. Required attributes
3.1 name
3.2 status

##### recipient

1.
2.
3. There are no required attributes but you must include at least one optional attribute.
4. Optional Attributes
4.1 name
4.2 type
4.3 city
4.4 province
4.5 country

#### transcription_information
2. Must include the following elements: 
+ collection_date
+ method
+ repository
+ transcriber
+ transcription_date
+ type
+ url
