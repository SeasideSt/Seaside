tests
testKeyAtValue
	key := cache store: 1.
	self assert: (cache keyAtValue: 1) = key.
	self assert: (cache keyAtValue: 2) isNil