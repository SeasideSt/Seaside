tests-accessing
testTarget
	self
		assert: self newEvent target
		equals: 'arguments[0].target'.
	self
		assert: self clickEvent target
		equals: self function , '.Event("click").target'