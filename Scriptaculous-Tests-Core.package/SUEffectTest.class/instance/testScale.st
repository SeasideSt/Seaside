tests
testScale
	self
		assert: (self effect scale: 50)
		equals: 'new Effect.Scale(this,50)'.
	self
		assert: (self effect id: 'foo'; duration: 1; scale: 25)
		equals: 'new Effect.Scale("foo",25,{"duration":1})'