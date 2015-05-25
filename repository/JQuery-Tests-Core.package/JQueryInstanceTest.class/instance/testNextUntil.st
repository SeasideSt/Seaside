tests-navigating
testNextUntil
	self
		assert: (((self jQuery: 'div')) nextUntil: 'p')
		equals: self function , '("div").nextUntil("p")'