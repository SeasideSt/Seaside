tests-objects
testBigObject
	| result |
	result := self parse: ' { "a" : 1 , "b" : 2 } '.
	self assert: result isDictionary.
	self assert: result size equals: 2.
	self assert: (result at: 'a') equals: 1.
	self assert: (result at: 'b') equals: 2