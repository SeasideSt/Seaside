tests-data
testDataAtPut
	self
		assert: ((self jQuery: 'button') dataAt: 'foo' put: false)
		equals: self function , '("button").data("foo",false)'