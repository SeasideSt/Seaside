tests-creation
testClass
	self
		assert: (self jQuery class: 'foo')
		equals: self function , '(".foo")'