tests-data
testUniqueSort
	self
		assert: (self jQuery: 'div') uniqueSort
		equals: self function , '("div").uniqueSort()'