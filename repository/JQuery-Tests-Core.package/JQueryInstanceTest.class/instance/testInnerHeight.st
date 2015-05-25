tests-css
testInnerHeight
	self
		assert: (((self jQuery: 'div')) innerHeight)
		equals: self function , '("div").innerHeight()'