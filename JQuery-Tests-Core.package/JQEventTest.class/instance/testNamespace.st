tests-accessing
testNamespace
	self
		assert: self newEvent namespace
		equals: 'arguments[0].namespace'.
	self
		assert: self clickEvent namespace
		equals: self function , '.Event("click").namespace'