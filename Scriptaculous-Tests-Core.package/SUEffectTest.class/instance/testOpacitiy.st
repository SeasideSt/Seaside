tests
testOpacitiy
	self
		assert: (self effect opacity)
		equals: 'new Effect.Opacity(this)'.
	self
		assert: (self effect opacity; id: 'foo'; duration: 1)
		equals: 'new Effect.Opacity("foo",{"duration":1})'