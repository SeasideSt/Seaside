tests
testBasic
	self
		assert: self effect
		equals: 'Effect.toggle(this)'.
	self
		assert: (self effect id: 'foo'; fps: 24)
		equals: 'Effect.toggle("foo",{"fps":24})'.
	self
		assert: (self effect id: 'bar'; duration: 2; shake)
		equals: 'new Effect.Shake("bar",{"duration":2})'