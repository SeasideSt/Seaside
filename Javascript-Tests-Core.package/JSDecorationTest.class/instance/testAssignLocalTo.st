tests
testAssignLocalTo
	self
		assert: (self mock assignLocalTo: 'x')
		equals: 'var x=mock'