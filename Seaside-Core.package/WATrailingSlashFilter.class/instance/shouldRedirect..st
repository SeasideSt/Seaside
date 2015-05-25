testing
shouldRedirect: aRequestContext
	^ aRequestContext request isGet and: [ aRequestContext request url slash not ]