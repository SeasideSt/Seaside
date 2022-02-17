tests-copy
testWithoutResource
	| copy |
	url addField: 'foo' value: 'bar'.
	url scheme: 'http'.
	url host: 'localhost'.
	url port: 9000.
	
	copy := url withoutResource.
	url addToPath: 'zork'.
	url addField: 'zork'.
	self assert: url printString equals: 'http://localhost:9000/zork?foo=bar&zork'.
	self assert: copy printString equals: 'http://localhost:9000/'