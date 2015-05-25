tests
testNot
	self
		assert: self mock not
		equals: '!mock'.
	self
		assert: self mock not not
		equals: '!!mock'