tests-data
testDataAt
	self
		assert: ((self jQuery: 'button') dataAt: 'foo')
		equals: self function , '("button").data("foo")'