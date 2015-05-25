tests-copy
testWithoutQuery
	| copy |
	url addField: 'foo' value: 'bar'.
	copy := url withoutQuery.
	url addToPath: 'zork'.
	url addField: 'zork'.
	self assert: url printString = '/zork?foo=bar&zork'.
	self assert: copy printString = '/'