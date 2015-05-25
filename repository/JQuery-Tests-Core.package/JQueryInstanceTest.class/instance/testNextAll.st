tests-navigating
testNextAll
	self
		assert: (((self jQuery: 'div')) nextAll)
		equals: self function , '("div").nextAll()'.
	self
		assert: ((self jQuery: 'div') nextAll: 'p')
		equals: self function , '("div").nextAll("p")'