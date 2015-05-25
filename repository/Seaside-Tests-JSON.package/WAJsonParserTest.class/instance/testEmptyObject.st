tests-objects
testEmptyObject
	| result |
	result := self parse: '{}'.
	self assert: result isDictionary.
	self assert: result isEmpty