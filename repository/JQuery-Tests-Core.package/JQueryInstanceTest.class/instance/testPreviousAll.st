tests-navigating
testPreviousAll
	self
		assert: (((self jQuery: 'div')) previousAll)
		equals: self function , '("div").prevAll()'.
	self
		assert: ((self jQuery: 'div') previousAll: 'p')
		equals: self function , '("div").prevAll("p")'