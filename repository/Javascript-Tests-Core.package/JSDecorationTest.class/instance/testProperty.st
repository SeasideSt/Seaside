tests
testProperty
	self
		assert: (self mock property: 'foo')
		equals: 'mock["foo"]'.
	self
		assert: (self mock property: 123)
		equals: 'mock[123]'.
	self
		assert: (self mock property: 'foo'; assign: 'bar')
		equals: 'mock["foo"]="bar"'