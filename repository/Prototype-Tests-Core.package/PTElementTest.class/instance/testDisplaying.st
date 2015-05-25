tests
testDisplaying
	self
		assert: (self element hide)
		equals: '$(this).hide()'.
	self
		assert: (self element id: 'foo'; show)
		equals: '$("foo").show()'.
	self
		assert: (self element toggle)
		equals: '$(this).toggle()'.
	self
		assert: (self element id: 'bar'; scroll)
		equals: '$("bar").scrollTo()'