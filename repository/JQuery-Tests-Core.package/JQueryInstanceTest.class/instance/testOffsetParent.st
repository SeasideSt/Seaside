tests-css
testOffsetParent
	self
		assert: (((self jQuery: 'div')) offsetParent)
		equals: self function , '("div").offsetParent()'