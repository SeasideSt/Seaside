tests-accessors-smalltalk
testAt
	self
		assert: ((self jQuery: 'div') at: 1)
		equals: self function , '("div").get(1)'