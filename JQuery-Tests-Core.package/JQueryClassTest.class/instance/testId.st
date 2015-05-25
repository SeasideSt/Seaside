tests-creation
testId
	self
		assert: (self jQuery id: 'foo')
		equals: self function , '("#foo")'