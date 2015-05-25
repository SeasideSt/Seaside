tests-array
testBigArray
	| result |
	result := self parse: ' [ "a" , "b" ] '.
	self assert: result isArray.
	self assert: result size = 2.
	self assert: result first = 'a'.
	self assert: result second = 'b'