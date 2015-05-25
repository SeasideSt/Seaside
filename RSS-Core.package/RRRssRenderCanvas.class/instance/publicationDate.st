channel-optional
publicationDate
	"---- as optional subelement of channel ----
	The publication date for the content in the channel. For example, the New York Times publishes on a daily basis, the publication date flips once every 24 hours. That's when the pubDate of the channel changes. All date-times in RSS conform to the Date and Time Specification of RFC 822(http://asg.web.cmu.edu/rfc/rfc822.html#sec-5), with the exception that the year may be expressed with two characters or four characters (four preferred).
	
	---- as optional subelement of item ----
	Indicates when the item was published.
	Its value is a date, indicating when the item was published. If it's a date in the future, aggregators may choose to not display the item until that date.
	
	e.g: 'Sat, 07 Sep 2002 00:00:01 GMT'
	minimal: '20 Jun 82 23:59 EST'"
	^ self tag: 'pubDate'