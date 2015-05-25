tests
testMultipleEntry
	| value |
	value := mutex critical: [ mutex critical: [ 1 ] ].
	
	self assert: value = 1.
	self assert: mutex owner isNil