tests-classes
testRemoveClass
	self
		assert: ((self jQuery: 'p:even') removeClass: 'selected')
		equals: self function , '("p:even").removeClass("selected")'