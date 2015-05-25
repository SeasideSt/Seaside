tests
testAssign
	self
		assert: (self mock assign: 1)
		equals: 'mock=1'