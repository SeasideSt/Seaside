tests
testAt
	self assert: (cache at: key) isNil.
	self assert: (cache at: (cache store: 1)) = 1