tests-css
testPosition
	self
		assert: (((self jQuery: 'div')) position)
		equals: self function , '("div").position()'.
	self
		assert: (((self jQuery: 'div')) positionLeft)
		equals: self function , '("div").position().left'.
	self
		assert: (((self jQuery: 'div')) positionTop)
		equals: self function , '("div").position().top'