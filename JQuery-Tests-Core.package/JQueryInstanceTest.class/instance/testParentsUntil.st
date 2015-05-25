tests-navigating
testParentsUntil
	self
		assert: ((self jQuery: 'div') parentsUntil: 'p')
		equals: self function , '("div").parentsUntil("p")'