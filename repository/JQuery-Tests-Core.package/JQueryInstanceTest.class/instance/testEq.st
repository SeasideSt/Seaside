tests-accessors
testEq
	self
		assert: ((self jQuery: 'div') eq: 4)
		equals: self function , '("div").eq(4)'.
	self
		assert: ((self jQuery: 'div') eq: -1)
		equals: self function , '("div").eq(-1)'