tests-utilities
testContains
	self
		assert: (self jQuery contains: 1 in: #(1 2 3))
		equals: self function , '.contains([1,2,3],1)'