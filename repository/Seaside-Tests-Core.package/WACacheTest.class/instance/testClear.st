tests
testClear
	key := cache store: 1.
	cache clear.
	self assert: (cache at: key) isNil.
	self assert: (cache keyAtValue: 1) isNil