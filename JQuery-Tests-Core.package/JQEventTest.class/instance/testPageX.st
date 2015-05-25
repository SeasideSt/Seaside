tests-accessing
testPageX
	self
		assert: self newEvent pageX
		equals: 'arguments[0].pageX'.
	self
		assert: self clickEvent pageX
		equals: self function , '.Event("click").pageX'