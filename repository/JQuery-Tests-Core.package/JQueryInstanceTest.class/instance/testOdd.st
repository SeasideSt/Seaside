tests-accessors-smalltalk
testOdd
	self
		assert: ((self jQuery: 'div') odd)
		equals: self function , '("div").odd()'