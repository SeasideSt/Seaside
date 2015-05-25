tests-modifying
testUnwrap
	self
		assert: ((self jQuery: 'p') unwrap)
		equals: self function , '("p").unwrap()'