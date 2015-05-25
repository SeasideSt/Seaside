tests-filtering
testFilter
	self
		assert: ((self jQuery: 'div') filter: 'p')
		equals: self function , '("div").filter("p")'