tests-navigating
testParent
	self
		assert: (((self jQuery: 'div')) parent)
		equals: self function , '("div").parent()'.
	self
		assert: ((self jQuery: 'div') parent: 'p')
		equals: self function , '("div").parent("p")'