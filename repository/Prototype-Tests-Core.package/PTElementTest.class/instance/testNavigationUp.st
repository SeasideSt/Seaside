tests
testNavigationUp
	self
		assert: (self element up)
		equals: '$(this).up()'.
	self
		assert: (self element up: 'div')
		equals: '$(this).up("div")'.
	self
		assert: (self element up: 'div' at: 2)
		equals: '$(this).up("div",2)'