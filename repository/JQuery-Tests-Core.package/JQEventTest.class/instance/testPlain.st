tests
testPlain
	self
		assert: self newEvent
		equals: 'arguments[0]'.
	self
		assert: self clickEvent
		equals: self function , '.Event("click")'