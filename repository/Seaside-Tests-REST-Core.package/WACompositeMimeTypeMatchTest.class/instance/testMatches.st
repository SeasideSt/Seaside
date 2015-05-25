tests
testMatches
	self assert: (match matches: (WAMimeType fromString: 'text/plain')).
	self deny: (match matches: (WAMimeType fromString: 'application/json'))