tests-with
testWithSymbol
	self
		assert: (self jQuery: #foo)
		equals: self function , '("#foo")'