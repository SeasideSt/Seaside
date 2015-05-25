tests-navigating
testSiblings
	self
		assert: (((self jQuery: 'div')) siblings)
		equals: self function , '("div").siblings()'.
	self
		assert: ((self jQuery: 'div') siblings: 'p')
		equals: self function , '("div").siblings("p")'