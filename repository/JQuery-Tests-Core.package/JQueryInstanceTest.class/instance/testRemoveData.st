tests-data
testRemoveData
	self
		assert: ((self jQuery: 'button') removeDataAt: 'foo')
		equals: self function , '("button").removeData("foo")'