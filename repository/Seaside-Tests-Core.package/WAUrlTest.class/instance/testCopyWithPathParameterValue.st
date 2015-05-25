tests-copy
testCopyWithPathParameterValue
	| copy |
	url addToPath: 'zork'.
	copy := url copy.
	url addPathParameterAt: 1 key: 'foo' value: 'bar'.
	self assert: url printString = '/zork;foo=bar'.
	self assert: copy printString = '/zork'