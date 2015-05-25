tests
testSimple
	| value |
	value := mutex critical: [ 1 ].
	
	self assert: value = 1.
	self assert: mutex owner isNil