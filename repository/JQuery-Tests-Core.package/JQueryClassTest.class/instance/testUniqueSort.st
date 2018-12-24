tests-utilities
testUniqueSort
	self
		assert: (self jQuery uniqueSort: #(1 2 2 3))
		equals: self function , '.uniqueSort([1,2,2,3])'