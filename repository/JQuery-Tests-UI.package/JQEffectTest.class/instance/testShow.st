tests
testShow
	self
		assert: (self effect show; blind)
		equals: self function , '("div").show("blind")'.
	self
		assert: (self effect show; clip)
		equals: self function , '("div").show("clip")'.
	self
		assert: (self effect show; drop)
		equals: self function , '("div").show("drop")'.
	self
		assert: (self effect show; explode)
		equals: self function , '("div").show("explode")'.
	self
		assert: (self effect show; fold)
		equals: self function , '("div").show("fold")'.
	self
		assert: (self effect show; puff)
		equals: self function , '("div").show("puff")'.
	self
		assert: (self effect show; pulsate)
		equals: self function , '("div").show("pulsate")'.
	self
		assert: (self effect show; scale)
		equals: self function , '("div").show("scale")'.
	self
		assert: (self effect show; slide)
		equals: self function , '("div").show("slide")'