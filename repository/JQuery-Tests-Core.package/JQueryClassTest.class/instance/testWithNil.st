tests-with
testWithNil
	self
		assert: (self jQuery: nil)
		equals: self function , '(this)'