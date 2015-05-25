tests
testNavigationDown
	self
		assert: (self element down)
		equals: '$(this).down()'.
	self
		assert: (self element down: 'div')
		equals: '$(this).down("div")'.
	self
		assert: (self element down: 'div' at: 2)
		equals: '$(this).down("div",2)'