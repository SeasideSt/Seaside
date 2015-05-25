tests-copy
testWithField
	| copy |
	copy := url withField: 'foo'.
	url addToPath: 'zork'.
	url addField: 'zork'.
	self assert: url printString = '/zork?zork'.
	self assert: copy printString = '/?foo'