tests
testParallel
	self
		assert: (self effect parallel: (Array with: self effect fade with: self effect slideUp))
		equals: 'new Effect.Parallel([new Effect.Fade(this),new Effect.SlideUp(this)])'.
	self
		assert: (self effect fps: 12; parallel: (Array with: self effect fade with: self effect slideUp))
		equals: 'new Effect.Parallel([new Effect.Fade(this),new Effect.SlideUp(this)],{"fps":12})'