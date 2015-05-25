tests-classes
testAddClass
	self
		assert: ((self jQuery: 'p:last') addClass: 'selected')
		equals: self function , '("p:last").addClass("selected")'