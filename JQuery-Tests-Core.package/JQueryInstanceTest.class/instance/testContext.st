tests-accessors
testContext
	self
		assert: ((self jQuery: 'div') context)
		equals: self function , '("div").context'