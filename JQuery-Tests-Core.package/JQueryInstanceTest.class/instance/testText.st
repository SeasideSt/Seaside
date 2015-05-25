tests-manipulating
testText
	self 
		assert: ((self jQuery: 'p') text)
		equals: self function , '("p").text()'.
	self 
		assert: ((self jQuery: 'p') text: 'foo')
		equals: self function , '("p").text("foo")'