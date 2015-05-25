tests-creation
testExpression
	self
		assert: (self jQuery expression: '#foo')
		equals: self function , '("#foo")'.
	self
		assert: (self jQuery expression: 'div > p')
		equals: self function , '("div > p")'.
	self
		assert: (self jQuery expression: 'ul li.active')
		equals: self function , '("ul li.active")'
