tests-with
testWithString
	self
		assert: (self jQuery: 'div > p')
		equals: self function , '("div > p")'