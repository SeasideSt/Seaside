tests-accessors-smalltalk
testEven
	self
		assert: ((self jQuery: 'div') even)
		equals: self function , '("div").even()'