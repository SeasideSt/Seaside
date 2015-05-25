tests
testCall
	self
		assert: (self mock call: 'foo')
		equals: 'mock.foo()'.
	self
		assert: (self mock call: nil)
		equals: 'mock()'.
	self
		assert: (self mock call: '')
		equals: 'mock()'