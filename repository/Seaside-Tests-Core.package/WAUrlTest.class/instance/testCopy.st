tests-copy
testCopy
	| copy |
	url addToPath: 'foo/bar'.
	url addField: 'foo' value: 'bar'.
	copy := url copy.
	url addToPath: 'zork'.
	url addField: 'zork'.
	self assert: url printString = '/foo/bar/zork?foo=bar&zork'.
	self assert: copy printString = '/foo/bar?foo=bar'
	