tests-array
testSmallArray
	| result |
	result := self parse: '["a"]'.
	self assert: result isArray.
	self assert: result size equals: 1.
	self assert: result first equals: 'a'