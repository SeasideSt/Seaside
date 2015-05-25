tests-utilities
testType
	self
		assert: (self jQuery type: true)
		equals: self function , '.type(true)'