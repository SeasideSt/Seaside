tests-classes
testHasClass
	self
		assert: ((self jQuery: 'p') hasClass: 'selected')
		equals: self function , '("p").hasClass("selected")'