tests-creation
testExpressionContext
	self
		assert: (self jQuery expression: '#foo' context: 123)
		equals: self function , '("#foo",123)'