tests
testConversion
	| converted |
	url
		host: 'example.com';
		addToPath: 'foo';
		addToPath: 'bar'.
	
	converted := 'http://example.com/foo/bar' seasideUrl.
	
	self assert: (converted isKindOf: WAUrl).
	self assert: url = converted