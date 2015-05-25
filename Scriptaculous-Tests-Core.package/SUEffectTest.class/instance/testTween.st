tests
testTween
	self
		assert: (self effect tweenFrom: 5 to: 0 using: 'blech')
		equals: 'new Effect.Tween(this,5,0,"blech")'