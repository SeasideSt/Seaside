tests-testing
testIsPropagationStopped
	self
		assert: self newEvent isPropagationStopped
		equals: 'arguments[0].isPropagationStopped()'.
	self
		assert: self clickEvent isPropagationStopped
		equals: self function , '.Event("click").isPropagationStopped()'