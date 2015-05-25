tests
testNavigationPrevious
	self
		assert: (self element previous)
		equals: '$(this).previous()'.
	self
		assert: (self element previous: 'div')
		equals: '$(this).previous("div")'.
	self
		assert: (self element previous: 'div' at: 2)
		equals: '$(this).previous("div",2)'