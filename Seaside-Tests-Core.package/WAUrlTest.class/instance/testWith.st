tests-copy
testWith
	| copy |
	copy := url with: 'with'.
	url addToPath: 'zork'.
	url addField: 'zork'.
	self assert: url printString = '/zork?zork'.
	self assert: copy printString = '/with'