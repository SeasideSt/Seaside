"
Structure of an RSS Document
Elements with a star (*) at the beginning are required. Elements with a plus sign (+) are an extension. Channel is automatically open.

channel
	*title
	*link
	*description
	language
	copyright
	managingEditor
	webMaster
	publicationDate
	lastBuildDate
	category
	generator
	documentation
	cloud
	timeToLive
	image
		*url
		*title
		*link
		width
		height
		description
	rating
	textInput
		*title
		*description
		*name
		*link
	skipHours
		hour
	skipDays
		day
	item
		*title
		*link
		*description
		author
		category
		comments
		enclosure
		guid
		publicationDate
		source
		+creator
		+comment
		+commentRss
		+contentEncoded
		
Email Addresses:
Email addresses must conform to RFC 2822
Convert the email address to a valid form. Examples of valid email addresses:
    * joesmith@example.com
    * joesmith@example.com (Joe Smith)
    * Joe Smith <joesmith@example.com>
    * joesmith.nospamplease@nospam.example.com
You can either:
- use correctly formatted strings
- implement #displayString in your domain email address class so that it return a string in a valid form
- implement #renderOn: in your domain  email address class so that it renders a string in a valid form
- use RREmailAddress

date times:
The value specified must meet the Date and Time specifications as defined by RFC822, with the exception that the year should be expressed as four digits.
Here are examples of valid RFC822 date-times:
Wed, 02 Oct 2002 08:00:00 EST
Wed, 02 Oct 2002 13:00:00 GMT
Wed, 02 Oct 2002 15:00:00 +0200

If you use Chronos you can use
printStringUsing: printStringUsing: ChronosPrintPolicy rfc822
Else you can use RRRfc822DateTime.

Here is an example of an invalid RFC822 date-time:
2002-10-02T08:00:00-05:00

"
Class {
	#name : #RRRssRenderCanvas,
	#superclass : #WAXmlCanvas,
	#category : 'RSS-Core'
}

{ #category : #'instance creation' }
RRRssRenderCanvas class >> builder [
	^ super builder
		rootClass: RRRssRoot;
		yourself
]

{ #category : #'generating-tags' }
RRRssRenderCanvas class >> generateBinaryFor: aCollection [
	(aCollection size = 4 and: [ (self includesSelector: aCollection third) not ]) ifTrue: [
		self 
			compile: aCollection third, ' aBlock
	self ', aCollection second, ' with: aBlock'
			classified: aCollection fourth ]
]

{ #category : #'accessing-tags' }
RRRssRenderCanvas class >> tags [
	"
	self generateTags
	"

	^ #(
		('item' item item: 'item')
	
		('title' title title: 'channel-required')
		('link' link link: 'channel-required')
		('description' description description: 'channel-required')

		
		('language' language language: 'channel-optional')
		('copyright' copyright copyright: 'channel-optional')
		('managingEditor' managingEditor managingEditor: 'channel-optional')
		('webMaster' webMaster webMaster: 'channel-optional')
		('pubDate' publicationDate publicationDate: 'channel-optional')
		('lastBuildDate' lastBuildDate lastBuildDate: 'channel-optional')
		('category' category category: 'channel-optional')
		('generator' generator generator: 'channel-optional')
		('docs' documentation documentation: 'channel-optional')
		('cloud' cloud cloud: 'channel-optional')
		('ttl' timeToLive timeToLive: 'channel-optional')
		('image' image image: 'channel-optional')
		('rating' rating rating: 'channel-optional')
		('textInput' textInput textInput: 'channel-optional')
		('skipHours' skipHours skipHours: 'channel-optional')
		('skipDays' skipDays skipDays: 'channel-optional')
		
		('author' author author: 'item-optional')
		('comments' comments comments: 'item-optional')
		('enclosure' enclosure enclosure: 'item-optional')
		('guid' guid guid: 'item-optional')
		('source' source source: 'item-optional')
		('language' language language: 'item-optional')
		
		('width' width width: 'image-optional')
		('height' height height: 'image-optional')
		
		('name' name name: 'textinput-required')
		
		('hour' hour hour: 'skipHours')
		('day' day day: 'skipDays')
		
		('url' url url: 'image')
		)
]

{ #category : #'item-optional' }
RRRssRenderCanvas >> author [
	"Email address of the author of the item.
	
	It's the email address of the author of the item. For newspapers and magazines syndicating via RSS, the author is the person who wrote the article that the <item> describes. For collaborative weblogs, the author of the item might be different from the managing editor or webmaster. For a weblog authored by a single individual it would make sense to omit the <author> element."
	^ self tag: 'author'
]

{ #category : #'item-optional' }
RRRssRenderCanvas >> author: aBlock [
	self author with: aBlock
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> category [
	"---- as optional subelement of channel ----
	Specify one or more categories that the channel belongs to. Follows the same rules as the <item>-level category element below.
	
	---- as optional subelement of item ----
	Includes the item in one or more categories.
	
	The value of the element is a forward-slash-separated string that identifies a hierarchic location in the indicated taxonomy. Processors may establish conventions for the interpretation of categories.
	
	You may include as many category elements as you need to, for different domains, and to have an item cross-referenced in different parts of the same domain.
	
	It has one optional attribute, domain, a string that identifies a categorization taxonomy.
	
	In RSS 2.0, a provision is made for linking a channel to its identifier in a cataloging system, using the channel-level category feature, described above. For example, to link a channel to its Syndic8 identifier, include a category element as a sub-element of <channel>, with domain 'Syndic8', and value the identifier for your channel in the Syndic8 database. The appropriate category element for Scripting News would be
	
	rss category
		domain: 'Syndic8';
		with: 1765"
	^ self brush: RRCategoryTag new
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> category: aBlock [
	self category with: aBlock
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> cloud [
	"Allows processes to register with a cloud to be notified of updates to the channel, implementing a lightweight publish-subscribe protocol for RSS feeds.
	
	for more info see RRCloudTag"
	^ self brush: RRCloudTag new
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> cloud: aBlock [
	self cloud with: aBlock
]

{ #category : #'well-formed-web' }
RRRssRenderCanvas >> comment [
	"This element appears in RSS feeds and contains the URI that comment entries are to be POSTed to. The details of this are outlined in the CommentAPI Specification (http://wellformedweb.org/story/9)"

	^ self tag: 'wfw:comment'
]

{ #category : #private }
RRRssRenderCanvas >> comment: aString [
]

{ #category : #'well-formed-web' }
RRRssRenderCanvas >> commentRss [
	"This element also appears in RSS feeds and contains the URI of the RSS feed for comments on that Item. This is documented in Chris Sells' Specification(http://www.sellsbrothers.com/spout/default.aspx?content=archive.htm#exposingRssComments). Note that for quite a while this page has had a typo and erroneously referred to this element as 'commentRSS' as opposed to the correct 'commentRss'. Feed consumers should be aware that they may run into both spellings in the wild. Please see this page (http://www.intertwingly.net/blog/2006/04/16/commentRss) for more information."

	^ self tag: 'wfw:commentRss'
]

{ #category : #'well-formed-web' }
RRRssRenderCanvas >> commentRss: aBlock [
	^ self commentRss with: aBlock
]

{ #category : #'item-optional' }
RRRssRenderCanvas >> comments [
	"URL of a page for comments relating to the item.
	
	If present, it is the url of the comments page for the item."
	^ self tag: 'comments'
]

{ #category : #'item-optional' }
RRRssRenderCanvas >> comments: aBlock [
	self comments with: aBlock
]

{ #category : #content }
RRRssRenderCanvas >> contentEncoded [
	"A module for the actual content of websites, in multiple formats.
	http://web.resource.org/rss/1.0/modules/content/
	
	example:
	rss contentEncoded: '<p>What a <em>beautiful</em> day!</p>'"
	^ self tag: 'content:encoded'
]

{ #category : #content }
RRRssRenderCanvas >> contentEncoded: aString [
	"A module for the actual content of websites.
	
	aString must not include ']]>'"
	self contentEncoded
		with: [ self cdata: aString ]
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> copyright [
	"Copyright notice for content in the channel."
	^ self tag: 'copyright'
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> copyright: aBlock [
	self copyright with: aBlock
]

{ #category : #'dublin core' }
RRRssRenderCanvas >> creator [
	"An entity primarily responsible for making the resource.
	Examples of a Creator include a person, an organization, or a service. Typically, the name of a Creator should be used to indicate the entity.
	
	http://dublincore.org/documents/dces/
	http://purl.org/dc/elements/1.1/creator"
	^ self tag: 'dc:creator'
]

{ #category : #'dublin core' }
RRRssRenderCanvas >> creator: aBlock [
	self creator with: aBlock
]

{ #category : #skipdays }
RRRssRenderCanvas >> day [
	^ self brush: RRDayTag new
]

{ #category : #skipdays }
RRRssRenderCanvas >> day: aBlock [
	self day with: aBlock
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> defaultDocumentation [
	self documentation: 'http://www.rssboard.org/rss-specification'
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> defaultGenerator [
	self generator: self defaultGeneratorString
]

{ #category : #private }
RRRssRenderCanvas >> defaultGeneratorString [
	^ 'Seaside-RSRSS'
]

{ #category : #'channel-required' }
RRRssRenderCanvas >> description [
	"
	---- as required subelement of channel ----
	Phrase or sentence describing the channel.
	e.g.: 'The latest news from GoUpstate.com, a Spartanburg Herald-Journal Web site.'
	
	---- a required subelement of item ----
	The item synopsis.
	
	---- as required subelement of textInput ----
	Explains the text input area.
	
	----  as an optional subelement of image ----
	contains text that is included in the TITLE attribute of the link formed around the image in the HTML rendering."
	^ self tag: 'description'
]

{ #category : #'channel-required' }
RRRssRenderCanvas >> description: aBlock [
	self description with: aBlock
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> documentation [
	"A URL that points to the documentation for the format used in the RSS file. It's probably a pointer to this page. It's for people who might stumble across an RSS file on a Web server 25 years from now and wonder what it is.
	e.g. 'http://www.rssboard.org/rss-specification'
	see #defaultDocumentation"
	^ self tag: 'docs'
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> documentation: aBlock [
	self documentation with: aBlock
]

{ #category : #'item-optional' }
RRRssRenderCanvas >> enclosure [
	"Describes a media object that is attached to the item.
	
	It has three required attributes. url says where the enclosure is located, length says how big it is in bytes, and type says what its type is, a standard MIME type.
	
	The url must be an http url.
	
	e.g.:
	rss enclosure
		url: 'http://www.scripting.com/mp3s/weatherReportSuite.mp3';
		length: 12216320;
		type: 'audio/mpeg'"
	^ self brush: RREnclosureTag new
]

{ #category : #'item-optional' }
RRRssRenderCanvas >> enclosure: aBlock [
	self enclosure with: aBlock
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> generator [
	"A string indicating the program used to generate the channel.
	e.g.: 'RSRSS-pmm.3'
	see #defaultGenerator"
	^ self tag: 'generator'
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> generator: aBlock [
	self generator with: aBlock
]

{ #category : #'item-optional' }
RRRssRenderCanvas >> guid [
	"A string that uniquely identifies the item.
	
	guid stands for globally unique identifier. It's a string that uniquely identifies the item. When present, an aggregator may choose to use this string to determine if an item is new.
	
	e.g.: 'http://some.server.com/weblogItem3207'
	
	There are no rules for the syntax of a guid. Aggregators must view them as a string. It's up to the source of the feed to establish the uniqueness of the string.
	
	If the guid element has an attribute named isPermaLink with a value of true, the reader may assume that it is a permalink to the item, that is, a url that can be opened in a Web browser, that points to the full item described by the <item> element. An example:
	
	e.g.:
	rss guid
		bePermaLink;
		with: 'http://inessential.com/2002/09/01.php#a2'
		
	isPermaLink is optional, its default value is true. If its value is false, the guid may not be assumed to be a url, or a url to anything in particular."
	^ self brush: RRGuidTag new
]

{ #category : #'item-optional' }
RRRssRenderCanvas >> guid: aBlock [
	self guid with: aBlock
]

{ #category : #'image-optional' }
RRRssRenderCanvas >> height [
	"Optional elements include <width> and <height>, numbers, indicating the width and height of the image in pixels.
	
	Maximum value for height is 400, default value is 31."
	^ self tag: 'height'
]

{ #category : #'image-optional' }
RRRssRenderCanvas >> height: aBlock [
	self height with: aBlock
]

{ #category : #skiphours }
RRRssRenderCanvas >> hour [
	^ self tag: 'hour'
]

{ #category : #skiphours }
RRRssRenderCanvas >> hour: aBlock [
	self hour with: aBlock
]

{ #category : #private }
RRRssRenderCanvas >> html: aString [
	self flush.
	self document nextPutAll: aString
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> image [
	"Specifies a GIF, JPEG or PNG image that can be displayed with the channel.
	the following subelements are required:
		url
		title
		link
	the following subelements are optional:
		width
		height
		description
	"
	^ self tag: 'image'
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> image: aBlock [
	self image with: aBlock
]

{ #category : #item }
RRRssRenderCanvas >> item [
	^ self tag: 'item'
]

{ #category : #item }
RRRssRenderCanvas >> item: aBlock [
	self item with: aBlock
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> language [
	"The language the channel is written in. This allows aggregators to group all Italian language sites, for example, on a single page. A list of allowable values for this element, as provided by Netscape, is implemented in the 'languages-generated' protocl of RRLanguageTag. You may also use values defined by the W3C (http://www.w3.org/TR/REC-html40/struct/dirlang.html#langcodes)."
	^ self brush: RRLanguageTag new
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> language: aBlock [
	self language with: aBlock
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> lastBuildDate [
	"The last time the content of the channel changed.
	again an RFC 822 date like all the other dates
	e.g.: 'Sat, 07 Sep 2002 09:42:31 GMT'"
	^ self tag: 'lastBuildDate'
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> lastBuildDate: aBlock [
	self lastBuildDate with: aBlock
]

{ #category : #'channel-required' }
RRRssRenderCanvas >> link [
	"---- as required subelement of channel ----
	The URL to the HTML website corresponding to the channel.
	e.g.: 'http://www.goupstate.com/'
	
	---- as required subelement of item ----
	The URL of the item.
	
	---- as required subelement of image ----
	is the URL of the site, when the channel is rendered, the image is a link to the site. (Note, in practice the image <title> and <link> should have the same value as the channel's <title> and <link>
	
	---- as required subelement of textInput ----
	The URL of the CGI script that processes text input requests."
	
	^ self tag: 'link'
]

{ #category : #'channel-required' }
RRRssRenderCanvas >> link: aBlock [
	self link with: aBlock
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> managingEditor [
	"Email address for person responsible for editorial content.
	e.g.: 'George Matesky <geo@herald.com>'"
	^ self tag: 'managingEditor'
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> managingEditor: aBlock [
	self managingEditor with: aBlock
]

{ #category : #'textinput-required' }
RRRssRenderCanvas >> name [
	"The name of the text object in the text input area."
	^ self tag: 'name'
]

{ #category : #'textinput-required' }
RRRssRenderCanvas >> name: aBlock [
	self name with: aBlock
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> publicationDate [
	"---- as optional subelement of channel ----
	The publication date for the content in the channel. For example, the New York Times publishes on a daily basis, the publication date flips once every 24 hours. That's when the pubDate of the channel changes. All date-times in RSS conform to the Date and Time Specification of RFC 822(http://asg.web.cmu.edu/rfc/rfc822.html#sec-5), with the exception that the year may be expressed with two characters or four characters (four preferred).
	
	---- as optional subelement of item ----
	Indicates when the item was published.
	Its value is a date, indicating when the item was published. If it's a date in the future, aggregators may choose to not display the item until that date.
	
	e.g: 'Sat, 07 Sep 2002 00:00:01 GMT'
	minimal: '20 Jun 82 23:59 EST'"
	^ self tag: 'pubDate'
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> publicationDate: aBlock [
	self publicationDate with: aBlock
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> rating [
	"The PICS (http://www.w3.org/PICS/) rating for the channel."
	^ self tag: 'rating'
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> rating: aBlock [
	self rating with: aBlock
]

{ #category : #convenience }
RRRssRenderCanvas >> renderContentEncoded: aOneArgumentBlock [
	"renders the html content of an item
	a render canvas will be passed as an argument to the block"
	self contentEncoded
		with: [
			self renderHtml: aOneArgumentBlock ]
]

{ #category : #convenience }
RRRssRenderCanvas >> renderHtml: aOneArgumentBlock [
	"convenience method to render html
	aOneArgumentBlock will be passed an html canvas"
	self text: (WAHtmlCanvas builder render: aOneArgumentBlock)
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> skipDays [
	"A hint for aggregators telling them which days they can skip.
	
	An XML element that contains up to seven <day> sub-elements whose value is Monday, Tuesday, Wednesday, Thursday, Friday, Saturday or Sunday. Aggregators may not read the channel during days listed in the skipDays element."
	^ self tag: 'skipDays'
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> skipDays: aBlock [
	self skipDays with: aBlock
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> skipHours [
	"A hint for aggregators telling them which hours they can skip.
	
	An XML element that contains up to 24 <hour> sub-elements whose value is a number between 0 and 23, representing a time in GMT, when aggregators, if they support the feature, may not read the channel on hours listed in the skipHours element. The hour beginning at midnight is hour zero."
	^ self tag: 'skipHours'
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> skipHours: aBlock [
	self skipHours with: aBlock
]

{ #category : #'item-optional' }
RRRssRenderCanvas >> source [
	"The RSS channel that the item came from.
	
	Its value is the name of the RSS channel that the item came from, derived from its <title>. It has one required attribute, url, which links to the XMLization of the source.
	
	rss source
		url: 'http://www.tomalak.org/links2.xml';
		with: 'Tomalak''s Realm'
	
	The purpose of this element is to propagate credit for links, to publicize the sources of news items. It can be used in the Post command of an aggregator. It should be generated automatically when forwarding an item from an aggregator to a weblog authoring tool."
	^ self brush: RRSourceTag new
]

{ #category : #'item-optional' }
RRRssRenderCanvas >> source: aBlock [
	self source with: aBlock
]

{ #category : #convenience }
RRRssRenderCanvas >> space [
	self html: self spaceEntity
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> textInput [
	"Specifies a text input box that can be displayed with the channel.
	The purpose of the <textInput> element is something of a mystery. You can use it to specify a search engine box. Or to allow a reader to provide feedback. Most aggregators ignore it.
	
	It has the following required subelements:
		title
		description
		name
		link"
	^ self tag: 'textInput'
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> textInput: aBlock [
	self textInput with: aBlock
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> timeToLive [
	"It's a number of minutes that indicates how long a channel can be cached before refreshing from the source. This makes it possible for RSS sources to be managed by a file-sharing network such as Gnutella.
	
	e.g.: 60"
	^ self tag: 'ttl'
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> timeToLive: aBlock [
	self timeToLive with: aBlock
]

{ #category : #'channel-required' }
RRRssRenderCanvas >> title [
	"----- as required subelement of channel ----
	The name of the channel. It's how people refer to your service. If you have an HTML website that contains the same information as your RSS file, the title of your channel should be the same as the title of your website.
	e.g.: 'GoUpstate.com News Headlines'
	
	---- as required subelement of item ----
	The title of the item.
	
	---- as required subelement of image ----
	describes the image, it's used in the ALT attribute of the HTML <img> tag when the channel is rendered in HTML
	
	---- as required subelement of textInput ----
	The label of the Submit button in the text input area."
	
	^ self tag: 'title'
]

{ #category : #'channel-required' }
RRRssRenderCanvas >> title: aBlock [
	self title with: aBlock
]

{ #category : #'image-required' }
RRRssRenderCanvas >> url [
	"is the URL of a GIF, JPEG or PNG image that represents the channel."
	^ self tag: 'url'
]

{ #category : #'image-required' }
RRRssRenderCanvas >> url: aBlock [
	self url with: aBlock
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> webMaster [
	"Email address for person responsible for technical issues relating to channel.
	e.g.: 'Betty Guernsey <betty@herald.com>'"
	^ self tag: 'webMaster'
]

{ #category : #'channel-optional' }
RRRssRenderCanvas >> webMaster: aBlock [
	self webMaster with: aBlock
]

{ #category : #'image-optional' }
RRRssRenderCanvas >> width [
	"Optional elements include <width> and <height>, numbers, indicating the width and height of the image in pixels.
	
	Maximum value for width is 144, default value is 88."
	^ self tag: 'width'
]

{ #category : #'image-optional' }
RRRssRenderCanvas >> width: aBlock [
	self width with: aBlock
]

{ #category : #convenience }
RRRssRenderCanvas >> withLineBreaks: aString [
	aString isEmptyOrNil
		ifTrue: [ ^ self ].
	self renderHtml: [ :html | html withLineBreaks: aString ]
]
