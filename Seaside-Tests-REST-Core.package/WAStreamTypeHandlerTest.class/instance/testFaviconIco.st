tests
testFaviconIco
	self assertPerformGetTo: #('favicon.ico') equals: handler faviconIco contentType: nil