tests
testConcatenate
	self
		assert: (self mock , 2 , 3)
		equals: 'mock;2;3'.
	self
		assert: (self mock , nil , self mock)
		equals: 'mock;null;mock'