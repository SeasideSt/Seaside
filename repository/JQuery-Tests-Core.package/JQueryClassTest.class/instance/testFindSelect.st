tests-utilities
testFindSelect
	self
		assert: (self jQuery findSelect: '#foo' in: 123)
		equals: self function , '.find.select("#foo",123)'