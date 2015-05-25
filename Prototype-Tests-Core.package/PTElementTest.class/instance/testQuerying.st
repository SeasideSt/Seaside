tests
testQuerying
	self
		assert: (self element descendantOf: 'foo')
		equals: '$(this).descendantOf("foo")'.
	self
		assert: (self element empty)
		equals: '$(this).empty()'.
	self
		assert: (self element firstDescendant)
		equals: '$(this).firstDescendant()'.
	self
		assert: (self element identify)
		equals: '$(this).identify()'.
	self
		assert: (self element match: 'first-child')
		equals: '$(this).match("first-child")'