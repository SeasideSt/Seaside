tests-utilities
testFindCompile
	self
		assert: (self jQuery findCompile: '#foo')
		equals: self function , '.find.compile("#foo")'