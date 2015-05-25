tests-navigating
testNext
	self
		assert: (((self jQuery: 'div')) next)
		equals: self function , '("div").next()'.
	self
		assert: ((self jQuery: 'div') next: 'p')
		equals: self function , '("div").next("p")'