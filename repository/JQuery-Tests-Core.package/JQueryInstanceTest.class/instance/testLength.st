tests-accessors-smalltalk
testLength
	self
		assert: ((self jQuery: 'div') length)
		equals: self function , '("div").length'