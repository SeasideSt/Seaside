tests-navigating
testChildren
	self
		assert: (((self jQuery: 'div')) children)
		equals: self function , '("div").children()'.
	self
		assert: ((self jQuery: 'div') children: 'p')
		equals: self function , '("div").children("p")'