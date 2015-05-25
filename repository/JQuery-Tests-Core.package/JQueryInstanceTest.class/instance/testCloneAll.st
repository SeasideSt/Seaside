tests-copying
testCloneAll
	self
		assert: (((self jQuery: 'div')) cloneAll)
		equals: self function , '("div").clone(true)'