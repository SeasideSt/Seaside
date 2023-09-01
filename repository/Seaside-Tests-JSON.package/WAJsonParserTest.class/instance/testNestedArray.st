tests-array
testNestedArray
	| result |
	result := self parse: '[[2]]'.
	self assert: result isArray.
	self assert: result size equals: 1.
	result := result first.
	self assert: result isArray.
	self assert: result size equals: 1.
	self assert: result first equals: 2