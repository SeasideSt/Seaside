tests
testActions
	self
		assert: ((self jQuery: 'ul') selectable refresh)
		equals: self function , '("ul").selectable("refresh")'