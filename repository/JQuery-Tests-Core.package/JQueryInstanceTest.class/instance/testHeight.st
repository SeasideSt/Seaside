tests-css
testHeight
	self
		assert: (((self jQuery: 'div')) height)
		equals: self function , '("div").height()'.
	self
		assert: (((self jQuery: 'div')) height: 17)
		equals: self function , '("div").height(17)'