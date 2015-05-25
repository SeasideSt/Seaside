tests-accessing
testCurrentTarget
	self
		assert: self newEvent currentTarget
		equals: 'arguments[0].currentTarget'.
	self
		assert: self clickEvent currentTarget
		equals: self function , '.Event("click").currentTarget'