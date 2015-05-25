tests-copy
testWithFieldValue
	| copy |
	copy := url withField: 'foo' value: 'bar'.
	url addToPath: 'zork'.
	url addField: 'zork'.
	self assert: url printString = '/zork?zork'.
	self assert: copy printString = '/?foo=bar'