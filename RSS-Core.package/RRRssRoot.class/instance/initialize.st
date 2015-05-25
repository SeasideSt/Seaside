initialization
initialize
	
	super initialize.
	rssAttributes := WAHtmlAttributes new
		at: 'version' put: '2.0';
		at: 'xmlns:content' put: 'http://purl.org/rss/1.0/modules/content/';
		at: 'xmlns:wfw' put: 'http://wellformedweb.org/CommentAPI/';
		at: 'xmlns:dc' put: 'http://purl.org/dc/elements/1.1/';
		yourself.
	channelAttributes := WAHtmlAttributes new