tests-copying
testClone
	self
		assert: (((self jQuery: 'div')) clone)
		equals: self function , '("div").clone()'