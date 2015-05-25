tests
testBinary
	self
		assert: (self mock & false)
		equals: 'mock&&false'.
	self
		assert: (self mock | 1)
		equals: 'mock||1'