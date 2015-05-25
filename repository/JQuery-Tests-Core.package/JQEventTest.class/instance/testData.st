tests-accessing
testData
	self
		assert: self newEvent data
		equals: 'arguments[0].data'.
	self
		assert: self clickEvent data
		equals: self function , '.Event("click").data'