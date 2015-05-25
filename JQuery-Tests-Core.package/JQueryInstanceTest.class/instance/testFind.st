tests-navigating
testFind
	self
		assert: ((self jQuery: 'div') find: ':even')
		equals: self function , '("div").find(":even")'