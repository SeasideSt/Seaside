tests-copy
testCopyWithPathParameter
	| copy |
	url addToPath: 'zork'.
	copy := url copy.
	url addPathParameterAt: 1 key: 'foo'.	
	self assert: url printString = '/zork;foo'.
	self assert: copy printString = '/zork'