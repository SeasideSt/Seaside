tests-objects
testSmallObject
	| result |
	result := self parse: '{"a":1}'.
	self assert: result isDictionary.
	self assert: result size equals: 1.
	self assert: (result at: 'a') equals: 1