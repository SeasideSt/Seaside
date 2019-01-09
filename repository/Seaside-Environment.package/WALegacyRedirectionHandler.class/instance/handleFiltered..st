handling
handleFiltered: aRequestContext
	| url |
	url := aRequestContext request url copy.
	url path removeFirst.
	aRequestContext respond: [ :response |
		response
			movedPermanently;
			location: url ]