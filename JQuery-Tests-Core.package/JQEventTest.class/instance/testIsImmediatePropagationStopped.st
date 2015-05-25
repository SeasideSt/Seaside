tests-testing
testIsImmediatePropagationStopped
	self
		assert: self newEvent isImmediatePropagationStopped
		equals: 'arguments[0].isImmediatePropagationStopped()'.
	self
		assert: self clickEvent isImmediatePropagationStopped
		equals: self function , '.Event("click").isImmediatePropagationStopped()'