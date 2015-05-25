tests-navigating
testContents
	self
		assert: (((self jQuery: 'div')) contents)
		equals: self function , '("div").contents()'