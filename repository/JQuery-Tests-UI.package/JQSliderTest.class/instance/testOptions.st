tests
testOptions
	self
		assert: ((self jQuery: 'span') slider value: 0)
		equals: self function , '("span").slider({"value":0})'
