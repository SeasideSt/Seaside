tests-accessing
testType
	self
		assert: self newEvent type
		equals: 'arguments[0].type'.
	self
		assert: self clickEvent type
		equals: self function , '.Event("click").type'