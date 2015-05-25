tests-css
testOuterHeight
	self
		assert: (((self jQuery: 'div')) outerHeight)
		equals: self function , '("div").outerHeight()'