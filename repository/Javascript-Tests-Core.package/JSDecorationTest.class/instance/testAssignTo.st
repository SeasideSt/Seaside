tests
testAssignTo
	self
		assert: (self mock assignTo: 'x')
		equals: 'x=mock'