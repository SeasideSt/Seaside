tests-css
testWidth
	self
		assert: (((self jQuery: 'div')) width)
		equals: self function , '("div").width()'.
	self
		assert: (((self jQuery: 'div')) width: 17)
		equals: self function , '("div").width(17)'