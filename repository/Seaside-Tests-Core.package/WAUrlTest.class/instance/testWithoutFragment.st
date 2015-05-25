tests-copy
testWithoutFragment
	| copy |
	url fragment: 'foo'.
	copy := url withoutFragment.
	url addToPath: 'zork'.
	url addField: 'zork'.
	self assert: url printString = '/zork?zork#foo'.
	self assert: copy printString = '/'