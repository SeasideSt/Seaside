content
contentEncoded
	"A module for the actual content of websites, in multiple formats.
	http://web.resource.org/rss/1.0/modules/content/
	
	example:
	rss contentEncoded: '<p>What a <em>beautiful</em> day!</p>'"
	^ self tag: 'content:encoded'