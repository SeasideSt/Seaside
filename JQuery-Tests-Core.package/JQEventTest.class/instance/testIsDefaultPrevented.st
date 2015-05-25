tests-testing
testIsDefaultPrevented
	self
		assert: self newEvent isDefaultPrevented
		equals: 'arguments[0].isDefaultPrevented()'.
	self
		assert: self clickEvent isDefaultPrevented
		equals: self function , '.Event("click").isDefaultPrevented()'