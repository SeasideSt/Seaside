tests
testArray
	self assert: #(1 2 3) equals: '[1,2,3]'.
	self assert: (GRSmallOrderedSet withAll: #(1 2 3)) equals: '[1,2,3]'