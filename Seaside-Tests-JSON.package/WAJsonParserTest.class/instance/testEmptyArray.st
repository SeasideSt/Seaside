tests-array
testEmptyArray
	| result |
	result := self parse: '[]'.
	self assert: result isArray.
	self assert: result isEmpty