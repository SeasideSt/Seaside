tests-accessors-smalltalk
testLast
	self
		assert: ((self jQuery: 'div') last)
		equals: self function , '("div").last()'