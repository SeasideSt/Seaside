tests-css
testScrollLeft
	self
		assert: (((self jQuery: 'div')) scrollLeft)
		equals: self function , '("div").scrollLeft()'.
	self
		assert: (((self jQuery: 'div')) scrollLeft: 17)
		equals: self function , '("div").scrollLeft(17)'