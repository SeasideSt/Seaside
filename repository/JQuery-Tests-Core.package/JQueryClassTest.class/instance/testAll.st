tests-creation
testAll
	self
		assert: (self jQuery all)
		equals: self function , '("*")'