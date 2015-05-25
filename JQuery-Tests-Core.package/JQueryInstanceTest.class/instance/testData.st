tests-accessors
testData
	self
		assert: ((self jQuery: 'div') dataAt: 'foo')
		equals: self function , '("div").data("foo")'.
	self
		assert: ((self jQuery: 'div') dataAt: 'foo' put: 123)
		equals: self function , '("div").data("foo",123)'.
	self
		assert: ((self jQuery: 'div') removeDataAt: 'foo')
		equals: self function , '("div").removeData("foo")'