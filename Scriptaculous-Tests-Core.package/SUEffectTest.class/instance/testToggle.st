tests
testToggle
	self
		assert: self effect toggleAppear
		equals: 'Effect.toggle(this,"Appear")'.
	self
		assert: (self effect id: 'foo'; toggleSlide)
		equals: 'Effect.toggle("foo","Slide")'.
	self
		assert: (self effect fps: 15; toggleBlind)
		equals: 'Effect.toggle(this,"Blind",{"fps":15})'