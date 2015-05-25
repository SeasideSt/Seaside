tests-actions
testStopPropagation
	self
		assert: self newEvent stopPropagation
		equals: 'arguments[0].stopPropagation()'.
	self
		assert: self clickEvent stopPropagation
		equals: self function , '.Event("click").stopPropagation()'