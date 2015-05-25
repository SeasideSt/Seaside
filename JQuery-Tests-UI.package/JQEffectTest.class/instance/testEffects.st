tests
testEffects
	self
		assert: self effect
		equals: self function , '("div").effect("highlight")'.
	self
		assert: self effect bounce
		equals: self function , '("div").effect("bounce")'.
	self
		assert: self effect highlight
		equals: self function , '("div").effect("highlight")'.
	self
		assert: self effect shake
		equals: self function , '("div").effect("shake")'.
	self
		assert: self effect size
		equals: self function , '("div").effect("size")'.
	self
		assert: self effect transfer
		equals: self function , '("div").effect("transfer")'