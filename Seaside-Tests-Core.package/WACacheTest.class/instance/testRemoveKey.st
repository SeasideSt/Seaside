tests
testRemoveKey
	key := cache store: 1.
	self assert: (cache removeKey: key) = 1.
	self assert: (cache at: key) isNil.
	self assert: (cache keyAtValue: 1) isNil