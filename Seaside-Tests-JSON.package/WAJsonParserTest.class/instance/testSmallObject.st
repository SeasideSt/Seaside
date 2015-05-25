tests-objects
testSmallObject
	| result |
	result := self parse: '{"a":1}'.
	self assert: result isDictionary.
	self assert: result size = 1.
	self assert: (result at: 'a') = 1