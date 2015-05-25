tests-objects
testBigObject
	| result |
	result := self parse: ' { "a" : 1 , "b" : 2 } '.
	self assert: result isDictionary.
	self assert: result size = 2.
	self assert: (result at: 'a') = 1.
	self assert: (result at: 'b') = 2