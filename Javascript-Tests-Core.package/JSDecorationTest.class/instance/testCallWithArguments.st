tests
testCallWithArguments
	self
		assert: (self mock call: 'foo' withArguments: #(1 2 3 4 5))
		equals: 'mock.foo(1,2,3,4,5)'.
	self
		assert: (self mock call: nil withArguments: #(1 2 3 4 5))
		equals: 'mock(1,2,3,4,5)'.
	self
		assert: (self mock call: '' withArguments: #(1 2 3 4 5))
		equals: 'mock(1,2,3,4,5)'