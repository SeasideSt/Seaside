tests
testMatches
	| pattern mimeType |
	pattern := WAMimeType fromString: 'image/png'.
	mimeType := WAMimeType fromString: 'image/png'.
	self assert: (mimeType matches: pattern).
	
	mimeType := WAMimeType fromString: 'image/gif'.
	self deny: (mimeType matches: pattern).
	
	pattern := WAMimeType fromString: 'image/*'.
	mimeType := WAMimeType fromString: 'image/png'.
	self assert: (mimeType matches: pattern).
	
	mimeType := WAMimeType fromString: 'text/html'.
	self deny: (mimeType matches: pattern).
	
	pattern := WAMimeType fromString: '*/*'.
	mimeType := WAMimeType fromString: 'image/png'.
	self assert: (mimeType matches: pattern)