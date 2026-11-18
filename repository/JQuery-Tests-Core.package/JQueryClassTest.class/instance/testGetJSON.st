tests
testGetJSON
	self
		assert: (self jQuery getJSON: '/customers')
		equals: self function, '.getJSON("/customers")'