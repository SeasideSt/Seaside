tests-utilities
testFindSetDocument
	self
		assert: (self jQuery findSetDocument: 123)
		equals: self function , '.find.setDocument(123)'