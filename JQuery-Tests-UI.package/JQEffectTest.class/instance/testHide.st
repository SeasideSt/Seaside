tests
testHide
	self
		assert: (self effect hide; blind)
		equals: self function , '("div").hide("blind")'.
	self
		assert: (self effect hide; clip)
		equals: self function , '("div").hide("clip")'.
	self
		assert: (self effect hide; drop)
		equals: self function , '("div").hide("drop")'.
	self
		assert: (self effect hide; explode)
		equals: self function , '("div").hide("explode")'.
	self
		assert: (self effect hide; fold)
		equals: self function , '("div").hide("fold")'.
	self
		assert: (self effect hide; puff)
		equals: self function , '("div").hide("puff")'.
	self
		assert: (self effect hide; pulsate)
		equals: self function , '("div").hide("pulsate")'.
	self
		assert: (self effect hide; scale)
		equals: self function , '("div").hide("scale")'.
	self
		assert: (self effect hide; slide)
		equals: self function , '("div").hide("slide")'