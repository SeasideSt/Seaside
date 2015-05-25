tests-utilities
testUnique
	self
		assert: (self jQuery unique: #(1 2 2 3))
		equals: self function , '.unique([1,2,2,3])'