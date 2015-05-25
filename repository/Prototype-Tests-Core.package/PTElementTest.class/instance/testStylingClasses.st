tests
testStylingClasses
	self
		assert: (self element id: 'foo'; addClassName: 'bar')
		equals: '$("foo").addClassName("bar")'.
	self
		assert: (self element id: 'foo'; hasClassName: 'bar')
		equals: '$("foo").hasClassName("bar")'.
	self
		assert: (self element removeClassName: 'bar')
		equals: '$(this).removeClassName("bar")'.
	self
		assert: (self element id: 'foo'; toggleClassName: 'bar')
		equals: '$("foo").toggleClassName("bar")'