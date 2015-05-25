tests-filtering
testIs
	self
		assert: ((self jQuery: 'div') is: ':odd')
		equals: self function , '("div").is(":odd")'