handling
handleFiltered: aRequestContext
	| url |
	url := aRequestContext request url copy.
	url path removeFirst.
	aRequestContext response
		movedPermanently;
		location: url.
	aRequestContext respond