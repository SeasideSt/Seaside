tests
testCallWithWith
	self
		assert: (self mock call: 'foo' with: 1 with: 2)
		equals: 'mock.foo(1,2)'.
	self
		assert: (self mock call: nil with: 1 with: 2)
		equals: 'mock(1,2)'.
	self
		assert: (self mock call: '' with: 1 with: 2)
		equals: 'mock(1,2)'