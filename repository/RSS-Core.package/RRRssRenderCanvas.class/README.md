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
