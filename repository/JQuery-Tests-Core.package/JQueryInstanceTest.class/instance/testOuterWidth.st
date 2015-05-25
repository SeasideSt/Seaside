tests-css
testOuterWidth
	self
		assert: (((self jQuery: 'div')) outerWidth)
		equals: self function , '("div").outerWidth()'