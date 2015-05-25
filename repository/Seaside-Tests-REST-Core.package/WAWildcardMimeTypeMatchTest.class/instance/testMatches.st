tests
testMatches
	self assert: (match matches: (WAMimeType main: 'application' sub: 'xml')).
	self assert: (match matches: (WAMimeType main: 'something' sub: 'xml')).
	self assert: (match matches: (WAMimeType main: 'application' sub: 'something')).
	self assert: (match matches: (WAMimeType main: 'something' sub: 'something')).
	
	self assert: (match matches: (WAMimeType main: '*' sub: 'xml')).
	self assert: (match matches: (WAMimeType main: 'application' sub: '*')).
	self assert: (match matches: (WAMimeType main: '*' sub: '*'))