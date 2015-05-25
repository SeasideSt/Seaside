tests-accessors-smalltalk
testAtAll
	self
		assert: ((self jQuery: 'div') atAll)
		equals: self function , '("div").get()'