tests-navigating
testPrevious
	self
		assert: (((self jQuery: 'div')) previous)
		equals: self function , '("div").prev()'.
	self
		assert: ((self jQuery: 'div') previous: 'p')
		equals: self function , '("div").prev("p")'