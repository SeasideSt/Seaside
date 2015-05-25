tests-navigating
testParents
	self
		assert: (((self jQuery: 'div')) parents)
		equals: self function , '("div").parents()'.
	self
		assert: ((self jQuery: 'div') parents: 'p')
		equals: self function , '("div").parents("p")'