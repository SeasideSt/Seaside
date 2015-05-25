tests
testActions
	self
		assert: ((self jQuery: 'div') progressbar getValue)
		equals: self function , '("div").progressbar("value")'.
	self
		assert: ((self jQuery: 'div') progressbar setValue: 4)
		equals: self function , '("div").progressbar("value",4)'