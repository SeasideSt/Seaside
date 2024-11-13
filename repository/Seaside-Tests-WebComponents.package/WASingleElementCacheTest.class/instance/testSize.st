testing
testSize
	self assert: cache size equals: 0.
	cache at: 1 put: 'one'.
	self assert: cache size equals: 1.
	cache at: 2 put: 'two'.
	self assert: cache size equals: 1.