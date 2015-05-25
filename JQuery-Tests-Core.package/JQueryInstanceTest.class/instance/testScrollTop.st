tests-css
testScrollTop
	self
		assert: (((self jQuery: 'div')) scrollTop)
		equals: self function , '("div").scrollTop()'.
	self
		assert: (((self jQuery: 'div')) scrollTop: 17)
		equals: self function , '("div").scrollTop(17)'