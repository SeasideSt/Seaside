tests-objects
testNestedObject
	| result |
	result := self parse: '{"object":{"1":"2"}} '.
	self assert: result isDictionary.
	self assert: result size equals: 1.
	result := result at: 'object'.
	self assert: result isDictionary.
	self assert: result size equals: 1.
	self assert: (result at: '1') equals: '2'