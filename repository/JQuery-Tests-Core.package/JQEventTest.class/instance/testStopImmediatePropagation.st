tests-actions
testStopImmediatePropagation
	self
		assert: self newEvent stopImmediatePropagation
		equals: 'arguments[0].stopImmediatePropagation()'.
	self
		assert: self clickEvent stopImmediatePropagation
		equals: self function , '.Event("click").stopImmediatePropagation()'