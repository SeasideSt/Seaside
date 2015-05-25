tests-actions
testPreventDefault
	self
		assert: self newEvent preventDefault
		equals: 'arguments[0].preventDefault()'.
	self
		assert: self clickEvent preventDefault
		equals: self function , '.Event("click").preventDefault()'