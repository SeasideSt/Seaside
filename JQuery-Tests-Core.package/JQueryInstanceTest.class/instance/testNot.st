tests-filtering
testNot
	self
		assert: ((self jQuery: 'div') not: ':even')
		equals: self function , '("div").not(":even")'