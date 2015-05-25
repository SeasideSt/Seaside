tests-navigating
testAdd
	self
		assert: ((self jQuery: 'div') add: 'p')
		equals: self function , '("div").add("p")'.
	self
		assert: ((self jQuery: 'div') add: 'p' context: '#foo')
		equals: self function , '("div").add("p","#foo")'