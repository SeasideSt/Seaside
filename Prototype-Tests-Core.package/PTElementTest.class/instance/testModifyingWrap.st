tests
testModifyingWrap
	self
		assert: (self element wrap: 'p')
		equals: '$(this).wrap("p",{})'.
	self
		assert: (self element wrap: 'p' attributes: (Dictionary new at: 'id' put: 'foo'; yourself))
		equals: '$(this).wrap("p",{"id":"foo"})'