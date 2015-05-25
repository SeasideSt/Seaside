tests
testApply
	self
		assert: (self mock apply: #())
		equals: 'mock()'.
	self
		assert: (self mock apply: #(1))
		equals: 'mock(1)'.
	self
		assert: (self mock apply: #(1 true))
		equals: 'mock(1,true)'