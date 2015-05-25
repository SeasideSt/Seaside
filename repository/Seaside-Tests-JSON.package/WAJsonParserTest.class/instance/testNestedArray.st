tests-array
testNestedArray
	| result |
	result := self parse: '[[2]]'.
	self assert: result isArray.
	self assert: result size = 1.
	result := result first.
	self assert: result isArray.
	self assert: result size = 1.
	self assert: result first = 2