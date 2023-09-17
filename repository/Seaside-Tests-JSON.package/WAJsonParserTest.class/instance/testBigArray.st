tests-array
testBigArray
	| result |
	result := self parse: ' [ "a" , "b" ] '.
	self assert: result isArray.
	self assert: result size equals: 2.
	self assert: result first equals: 'a'.
	self assert: result second equals: 'b'