tests
testMatches
	self assert: (match matches: (WAMimeType main: 'application' sub: 'xml')).
	self deny: (match matches: (WAMimeType main: 'something' sub: 'xml')).
	self deny: (match matches: (WAMimeType main: 'application' sub: 'something')).
	self deny: (match matches: (WAMimeType main: 'something' sub: 'something')).
	
	self assert: (match matches: (WAMimeType main: '*' sub: 'xml')).
	self assert: (match matches: (WAMimeType main: 'application' sub: '*')).
	self assert: (match matches: (WAMimeType main: '*' sub: '*')).
	
	self deny: (match matches: (WAMimeType main: 'something' sub: '*')).
	self deny: (match matches: (WAMimeType main: '*' sub: 'something'))