tests-utilities
testFindTokenize
	self
		assert: (self jQuery findTokenize: '#foo')
		equals: self function , '.find.tokenize("#foo")'