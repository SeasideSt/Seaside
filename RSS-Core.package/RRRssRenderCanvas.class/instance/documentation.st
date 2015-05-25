channel-optional
documentation
	"A URL that points to the documentation for the format used in the RSS file. It's probably a pointer to this page. It's for people who might stumble across an RSS file on a Web server 25 years from now and wonder what it is.
	e.g. 'http://www.rssboard.org/rss-specification'
	see #defaultDocumentation"
	^ self tag: 'docs'