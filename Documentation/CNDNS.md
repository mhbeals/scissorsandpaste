# Purpose of Document #

This document describes the elements found in the Colonial Newspaper Database (CND)
and their usage when transcribing newspaper articles for inclusion within the database.

Each entry will include:  

Element name

+ Description  
+ Usage  
+ Required Attributes  
  + Attribute 1  
     + Attribute 2 Description  
     + Usage  
  + Attribute 2  
     + Attribute 2 Description  
     + Usage  
+ Optional Attributes  
  + Attribute 1  
     + Attribute 2 Description  
     + Usage  
  + Attribute 2  
     + Attribute 2 Description  
     + Usage  

Example of usage

# root

+ This is the root element for the CND.
+ Only used at start / end of database.
+ There are no permitted attributes.

&lt;root&gt;&lt;/root&gt;

## metadata

+ This contains the compiler and licensing information for the database.
+ Only used directly following &lt;root&gt; at the start of the database and must contain compiler and license information.
+ There are no permitted attributes.

&lt;metadata&gt;&lt;/metadata&gt;

### compiler

+ This is description of who the compiler of the database is.
+ Only used within the &lt;metadata&gt; element.
+ Required attributes 
   + email
     + Current contact email of compiler
     + email="m.beals@shu.ac.uk"
   + name
     + Name of compiler
     + name="M. H. Beals"
   + orcid
     + Orcid ID number of compiler
     + orcid="0000-0002-2907-3313"

&lt;compiler orcid="0000-0002-2907-3313" email="mhbeals@mhbeals.com" name="M. H. Beals"/&gt;

### license

+ This is the description of the license under which the database is made available.
+ Only used within the &lt;metadata&gt; element. Text is short, plain-text description of license.
+ Required attributes 
   + type
     + Short code of license type
     + type="CCBY"
   + version
     + Version of license
     + version="4.0"
   + url
     + Link to full legal code of license
     + url="https://creativecommons.org/licenses/by/4.0/legalcode"

 &lt;license type="CCBY" version="4.0" url="https://creativecommons.org/licenses/by/4.0/legalcode"&gt;
 This work is licensed under a Creative Commons Attribution 4.0 International License
 &lt;/license&gt;
         
## item

+ This contains the metadata and data of a single newspaper article.
+ Used to contain all elements related to a single newspaper article.
+ There are no permitted attributes.

&lt;item&gt;&lt;/item&gt;

### id

+ This contains the unique identifer code for a single newspaper article.
+ Only used directly following &lt;item&gt; at the start of the article entry. Text is a sequentially increasing integer. 
+ There are no permitted attributes.

&lt;id&gt;123&lt;/id&gt;

### publication_information

+ This contains the metadata relating to the newspaper and issue in which the article was found.
+ Only used directly following &lt;id&gt; element. Must include:
   + newspaper_title
   + newspaper_city
   + newspaper_province
   + newspaper_country
   + year
   + month
   + day
   + section_name
+ There are no permitted attributes.

 &lt;publication_information&gt;
	&lt;newspaper_title&gt;&lt;/newspaper_title&gt;
	&lt;newspaper_city&gt;&lt;/newspaper_city&gt;
	&lt;newspaper_province&gt;&lt;/newspaper_province&gt;
	&lt;newspaper_country&gt;&lt;/newspaper_country&gt;
	&lt;year&gt;&lt;/year&gt;
	&lt;month&gt;&lt;/month&gt;
	&lt;day&gt;&lt;/day&gt;
	&lt;section_name&gt;&lt;/section_name&gt;
&lt;/publication_information&gt;

#### newspaper_title
+ This contains the title of the publication in which the newspaper article appears.
+ Only used directly following &lt;publication_information&gt;. Text is a standardised version of the publication title. 
+ There are no permitted attributes.

&lt;newspaper_title&gt;Glasgow Advertiser&lt;/newspaper_title&gt;

#### newspaper_city

+ This contains the city in which the publication was published.
+ Only used directly following the &lt;newspaper_title&gt; element. Text is the modern, standard British name for the city. 
+ There are no permitted attributes.

&lt;newspaper_city&gt;Glasgow&lt;/newspaper_city&gt;

#### newspaper_province

+ This contains the province in which the publication was published.
+ Only used directly following the &lt;newspaper_city&gt; element. Text is the modern, standard British name for the province or state. 
   Home nations (England, Northern Ireland, Scotland, Wales) of the United Kingdom are treated as provinces.
+ There are no permitted attributes.

&lt;newspaper_province&gt;Scotland&lt;/newspaper_province&gt;

#### newspaper_country

+ This contains the country in which the publication was published.
+ Only used directly following the &lt;newspaper_province&gt; element. Text is the modern, standard British name for the country. 
+ There are no permitted attributes.

&lt;newspaper_country&gt;United Kingdom&lt;/newspaper_country&gt;

#### year

+ This contains the year in which the article was published.
+ Only used directly following the &lt;newspaper_country&gt; element. Text is the four-digit representation of the year. New style dates to be used. 
+ There are no permitted attributes.

&lt;year&gt;1789&lt;/year&gt;

#### month

+ This contains the month in which the article was published.
+ Only used directly following the &lt;year&gt; element. Text is the full length English name of the month. 
+ There are no permitted attributes.

&lt;month&gt;July&lt;/month&gt;
         
#### day

+ This contains the day on which the article was published.
+ Only used directly following the &lt;month&gt; element. Text is the one- or two-digit representation of the date.
+ There are no permitted attributes.

&lt;day&gt;1&lt;/day&gt;

#### section_name

+ This contains the section heading under which the article was published. This is general represented through increased 
   font-size or heavier font-type. It may appear several columns or pages previously. It generally represents the location 
   from which the news was obtained. 
+ Only used directly following the &lt;day&gt; element. Text is the main heading text. Unclear section headings should be omitted. 
   Ending punctuation should be omitted.
+ There are no permitted attributes.

&lt;section_name&gt;America&lt;/section_name&gt;

### articletype

+ This describes the type of article.
+ Only used directly following the &lt;/publication_information&gt; element. Text is one of the four possible types:
   + News
     + Straightforward news content.
   + Letter
     + In which the vast majority or the entirety of the article is from a single piece of correspondence.
   + Miscellany
     + Non-time-sensitive material. Primarily jokes, anecdotes, and poems. 
   + Advertisement
     + Paid-for material advertising goods or services. Reprinted 'curious' advertisements should be classed as Miscellany.
+ There are no permitted attributes.

&lt;articletype&gt;News&lt;/articletype&gt;

### p

+ This contains a paragraph or other typographically distinct sub-section. 
+ First instance immediately follows &lt;articletype&gt; element. May contain as many instances as necessary.
   Headings, datelines, and prefatory information to an article should be considered distinct paragraphs from the text that follows them.
   **May** contain the following elements:
   + pg
   + column
   + line
+ There are no permitted attributes.

&lt;p&gt;
&lt;pg n="1"&gt;
&lt;column/&gt;
&lt;line&gt;&lt;/line&gt;
&lt;/p&gt;

#### pg

+ This indicates a new page has begun between lines within the paragraph.
+ Must appear within a &lt;p&gt; element but outside any &lt;line&gt; element. First instance *must* appear directly following the first &lt;p&gt; element. 
   Subsequent instances should appear immediately following the &lt;line&gt; that appears at the bottom of a page, prior to any &lt;column&gt; element. 
   &lt;pg&gt; is always formatted as a closed element.
+ Required attributes:
   + n
   + Indicates the page on which the article appears. Text is a one or two-digit integer representing the page number. Publications without
    indicated page numbers are counted as physical 'sides'. 

&lt;p&gt;
&lt;pg n="1"&gt;
&lt;column/&gt;
&lt;line&gt;&lt;/line&gt;
&lt;/p&gt;

#### column

+ This indicates a new column has begun between lines within the paragraph.
+ Must appear within a &lt;p&gt; element but outside any &lt;line&gt; element. First instance *must* appear directly following the first &lt;pg&gt; element. 
   Subsequent instances should appear immediately preceding the &lt;line&gt; that appears at the top of a subsequent column or following any 
   subsequent &lt;pg&gt; element. &lt;column&gt; is always formatted as a closed element.
+ There are no permitted attributes.

&lt;p&gt;
&lt;pg n="1"/&gt;
&lt;column/&gt;
&lt;line&gt;&lt;/line&gt;
&lt;column/&gt;
&lt;line&gt;&lt;/line&gt;
&lt;pg n="2"/&gt;
&lt;column/&gt;
&lt;line&gt;&lt;/line&gt;
&lt;/p&gt;

#### line

+ This contains a single line of text from the newspaper article, as printed within the original publication.
+ Must appear within a &lt;p&gt; element. First instance appears after the first &lt;column&gt; element. May include as many
   instances as required to represent the paragraph text.
+ There are no permitted attributes.

&lt;p&gt;
&lt;pg n="1"&gt;
&lt;column/&gt;
&lt;line&gt;&lt;/line&gt;
&lt;/p&gt;

#### hlb

+ This indicates that there is a hard line break in the text. It is used for non-paragraph forms, such as tables, in which 
   'running the lines together' in paragraph form during an XSL output would be detrimental to the visual representation of
   the text.
+ Must appear at the end of a line of text, directly following the &lt;/line&gt; tag. &lt;hlb&gt; is always formatted at a closed element.
+ There are no permitted attributes.

&lt;p&gt;
&lt;pg n="1"&gt;
&lt;column/&gt;
&lt;line&gt;&lt;/line&gt;&lt;hlb/&gt;
&lt;/p&gt;

#### Formatting Indicators

The following elements indicate the original formatting of the article text.  All formatting indicators must appear within a &lt;line&gt; element.
Any formatting that appears on multiple lines should be closed at the conclusion of a line (before the &lt;/line&gt; tag) and repeated on the
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

+ Indicates the line of text was centered within a column.
+ Should only be used for full-line centering. Placed immediately following open &lt;line&gt; tag. 

&lt;line&gt;&lt;center&gt;&lt;/center&gt;&lt;/line&gt;

##### right

+ Indicates the line of text was right-justified within a column.
+ Should only be used for full-line right-justification. Placed immediately following open &lt;line&gt; tag. 

&lt;line&gt;&lt;right&gt;&lt;/right&gt;&lt;/line&gt;

##### flush_right

+ Indicates the end of a line was right-justified. Used within &lt;center&gt; or &lt;line&gt; element.
+ Should only be used when end of line is right-justified, rather than full-line right-justification. 
   Placed immediately before &lt;/line&gt; tag. 
    
&lt;line&gt;&lt;center&gt;Initial text. &lt;flush_right&gt;Right text.&lt;/flush_right&gt;&lt;/center&gt;&lt;/line&gt;
    
##### i

+ Indicates the original text was italicised.
+ Should not include final punctuation or trailing spaces.

&lt;line&gt;&lt;i&gt;Extract of a letter&lt;/i&gt;.&lt;/line&gt;
    
##### small_caps

+ Indicates the use of a different set of metal type, allowing for Small Caps. 
+ Should include all letters of the word. If the first letter is larger than the remaining uppercase letters, this indicates it was an 
   uppercase letter within the Small Caps font type, and should be indicated as such. All other letters should be written in lower case.
   Should not include final punctuation or trailing spaces. 
    
&lt;line&gt;&lt;center&gt;&lt;i&gt;&lt;small_caps&gt;America&lt;/small_caps&gt; the beautiful&lt;/i&gt;.&lt;/center&gt;&lt;/line&gt;

##### enlarged_capital

+ Indicates the use of a different metal type, allowing for a single enlarged letter at the start of a line.
+ Should only include those letters that are printed in enlarged typeface, usually a single letter.  It should not include the final
   punctuation or trailing spaces. There should be no space immediately following the closing tag before the remaining letters of the 
   word, if any.
   
&lt;line&gt;&lt;center&gt;&lt;i&gt;&lt;enlarged_capital&gt;A&lt;/enlarged_capital&gt;nother Massacre&lt;/i&gt;.&lt;/center&gt;&lt;/line&gt;

##### missing
+ Indicates text is not legible in the copy currently being examined.
+ Should surround all text which is illegible, but not those characters where are visible, even if this means multiple tags within a single word. Text
   should be one ? for a missing character or ??? for a missing word.  Multiple words can be indicated missing within a single tag. If a word is obvious
   but technically obscured, it can be placed instead of ??? but should remain within missing tags to indicate this is an educated guess.
+ Required attributes
   + type
   + Indicates why the text is missing.  May be:
     + copy blur
     + copy folded
     + copy torn
     + copy hole

&lt;line&gt;Jack and Jill w&lt;missing type="copy hole"&gt;ent&lt;/missing&gt; up the hill to fetch a p&lt;missing type="copy blur"&gt;???&lt;/missing&gt; of water &lt;/line&gt;

##### sh

+ Indicates the inclusion of a soft-hyphen.
+ Should be used *instead* of a soft-hyphen; a hyphen at the end of a line in a word that would not normally have a hyphen.
   Hyphens that would normally appear in the word should be maintained. Placed immediately before the closing &lt;/line&gt; tag.
   
&lt;line&gt;The time has come for all good men to come to the aid of their coun&lt;sh/&gt;&lt;/line&gt;
&lt;line&gt;try.&lt;/line&gt;

##### [space]

+ Indicates the space between the word at the end of one line and the beginning of another.
+ **All** lines which do not end in a soft-hyphen, or act as the final line in a paragraph &lt;p&gt;, must end with a space.

&lt;p&gt;
    &lt;line&gt;The time has come for all good men &lt;/line&gt;
    &lt;line&gt;to come to the aid of their country.&lt;/line&gt;
&lt;/p&gt;

#### Entity Indicators

The following elements indicate an entity (person, place, thing) in article text.  All entity indicators must appear within a &lt;line&gt; element.
Any formatting that appears on multiple lines should surround the largest segment of the indicating text, whether this is on the first or second
line of a sentence. They can be nested within or around formatting indicators in whichever way best avoids overlapping elements. They should include
as much of the immediately relevant text as possible, but avoid final punctuation and exclude trailing spaces, except where overlapping would occur. 

##### mention

+ Indicates a person, place or thing is mentioned, or a concept alluded to, in the text.
+ Mentions should surround the noun that either states or alludes to the person, place or thing. If a single word could indicate two of the same
   mention attribute type, nest multiple copies of the mention element. 
+ There are no required attributes. Use optional attributes as relevant.
+ Optional Attributes
   + city
     + Attribute text is the modern, standard British name for the city. If unincorporated land or no longer exists, omit. Place in same tag as 
      province and country, based on modern political designations, regardless if these are explicitly mentioned.
     + &lt;line&gt;We arrived in &lt;mention city="Glasgow" province="Scotland" country="United Kingdom"&gt;this place&lt;/mention&gt; last week.&lt;line&gt;
   + province
     + Attribute text is the modern, standard British name for the province or state. Place in same tag as country, based on modern political 
      designations, regardless if this is explicitly mentioned.
     + &lt;line&gt;We arrived in &lt;mention province="Scotland" country="United Kingdom"&gt;this place&lt;/mention&gt; last week.&lt;line&gt;
   + country
     + Attribute text is the modern, standard British name for the country.
     + &lt;line&gt;We arrived in &lt;mention country="United Kingdom"&gt;this place&lt;/mention&gt; last week.&lt;line&gt;
   + name
     + Attribute text is the standard name of a person mentioned in the text. Last-name-first. Place in same tag as dates, if known.
     + &lt;line&gt;We have yet to hear from &lt;mention name="Wayne, Anthony" dates="1 January 1745-15 December 1796"&gt;General Wayne&lt;/mention&gt;.&lt;/line&gt;
   + dates
     + Attribute text is the accepted date range for a person mentioned in the text. DD Month YYYY-DD Month YYYY. Unknown dates and months 
      should be omitted. Unknown year should be indicated with a ?. Must be used in conjunction with name attribute.
     + &lt;line&gt;We have yet to hear from &lt;mention name="Wayne, Anthony" dates="?-1796"&gt;General Wayne&lt;/mention&gt;.&lt;/line&gt;
   + group
     + Attribute text is the accepted name for a group or organisation.
     + &lt;line&gt;There was a meeting of the &lt;mention group="Society of Friends"&gt;Quakers&lt;/mention&gt; in London &lt;/line&gt; 
   + place
     + Attribute text is the accepted name for a landmark.
     + &lt;line&gt;&lt;mention place="College of William and Mary"&gt;College of William and Mary&lt;/mention&gt;, in 
      &lt;mention country="United States"&gt;New England&lt;/mention&gt;, &lt;/line&gt;
   + keyword
     + Attribute text is a concept or topic from a standardised list. Each keyword must be a separate element tag.
     + &lt;line&gt;for spreading the Christian &lt;mention keyword="religion"&gt;religion&lt;/mention&gt; amongst the 
      &lt;mention keyword="Native Americans"&gt;Indians&lt;/mention&gt; in the back settlements.&lt;/line&gt;
    
##### dateline
+  
+  
+ There are no required attributes but you must include at least one optional attribute.
+ Optional Attributes
   + city
   + province
   + country
   + day
   + month
   + year
   + newspaper
   + international_transport
    
##### author

+  
+  
+ Required attributes
   + name
   + status

##### recipient

+  
+  
+ There are no required attributes but you must include at least one optional attribute.
+ Optional Attributes
   + name
   + type
   + city
   + province
   + country

#### transcription_information

+ Must include the following elements: 
+ collection_date
+ method
+ repository
+ transcriber
+ transcription_date
+ type
+ url
