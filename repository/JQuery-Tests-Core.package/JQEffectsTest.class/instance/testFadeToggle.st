tests-effects
testFadeToggle
	self 
		assert: (self target fadeToggle: 'slow')
		equals: self function , '("div").fadeToggle("slow")'.
	self 
		assert: (self target fadeToggle: 'fast' callback: 'done')
		equals: self function , '("div").fadeToggle("fast",function(){done})'