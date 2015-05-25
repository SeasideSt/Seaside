tests-filtering
testSliceFrom
	self
		assert: ((self jQuery: 'div') sliceFrom: 0)
		equals: self function , '("div").slice(0)'