tests
testCallWith
	self
		assert: (self mock call: 'foo' with: 1)
		equals: 'mock.foo(1)'.
	self
		assert: (self mock call: nil with: 1)
		equals: 'mock(1)'.
	self
		assert: (self mock call: '' with: 1)
		equals: 'mock(1)'