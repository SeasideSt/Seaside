tests-navigating
testPreviousUntil
	self
		assert: (((self jQuery: 'div')) previousUntil: 'p')
		equals: self function , '("div").prevUntil("p")'