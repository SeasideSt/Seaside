tests
testNavigationNext
	self
		assert: (self element next)
		equals: '$(this).next()'.
	self
		assert: (self element next: 'div')
		equals: '$(this).next("div")'.
	self
		assert: (self element next: 'div' at: 2)
		equals: '$(this).next("div",2)'