tests-filtering
testHas
	self
		assert: ((self jQuery: 'div') has: ':odd')
		equals: self function , '("div").has(":odd")'