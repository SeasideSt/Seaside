tests
testRetrieve
	self assert: (cache at: key) isNil.
	key := cache store: 1.
	self assert: (cache at: key) = 1