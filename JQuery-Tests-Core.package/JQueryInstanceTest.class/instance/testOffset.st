tests-css
testOffset
	self
		assert: (((self jQuery: 'div')) offset)
		equals: self function , '("div").offset()'.
	self
		assert: (((self jQuery: 'div')) offsetLeft)
		equals: self function , '("div").offset().left'.
	self
		assert: (((self jQuery: 'div')) offsetTop)
		equals: self function , '("div").offset().top'