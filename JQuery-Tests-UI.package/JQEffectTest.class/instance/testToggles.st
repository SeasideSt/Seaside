tests
testToggles
	self
		assert: (self effect toggle; blind)
		equals: self function , '("div").toggle("blind")'.
	self
		assert: (self effect toggle; clip)
		equals: self function , '("div").toggle("clip")'.
	self
		assert: (self effect toggle; drop)
		equals: self function , '("div").toggle("drop")'.
	self
		assert: (self effect toggle; explode)
		equals: self function , '("div").toggle("explode")'.
	self
		assert: (self effect toggle; fade)
		equals: self function , '("div").toggle("fade")'.
	self
		assert: (self effect toggle; fold)
		equals: self function , '("div").toggle("fold")'.
	self
		assert: (self effect toggle; puff)
		equals: self function , '("div").toggle("puff")'.
	self
		assert: (self effect toggle; pulsate)
		equals: self function , '("div").toggle("pulsate")'.
	self
		assert: (self effect toggle; scale)
		equals: self function , '("div").toggle("scale")'.
	self
		assert: (self effect toggle; slide)
		equals: self function , '("div").toggle("slide")'