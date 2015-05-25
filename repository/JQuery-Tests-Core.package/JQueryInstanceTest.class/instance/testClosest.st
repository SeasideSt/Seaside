tests-navigating
testClosest
	self
		assert: (((self jQuery: 'div')) closest)
		equals: self function , '("div").closest()'.
	self
		assert: ((self jQuery: 'div') closest: 'p')
		equals: self function , '("div").closest("p")'