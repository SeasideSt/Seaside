item-optional
guid
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