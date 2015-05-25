tests-css
testInnerWidth
	self
		assert: (((self jQuery: 'div')) innerWidth)
		equals: self function , '("div").innerWidth()'