tests
testMove
	self
		assert: (self effect move: 1 @ 2)
		equals: 'new Effect.Move(this,{"x":1,"y":2})'.
	self
		assert: (self effect id: 'foo'; absolute; move: 3 @ 5)
		equals: 'new Effect.Move("foo",{"mode":"absolute","x":3,"y":5})'