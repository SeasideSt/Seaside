tests-events
testEventFire
	self
		assert: (self element fire: 'foo')
		equals: '$(this).fire("foo")'.
	self
		assert: (self element fire: 'foo' with: 123)
		equals: '$(this).fire("foo",123)'