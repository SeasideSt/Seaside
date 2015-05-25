tests-effects
testSlideToggle
	self 
		assert: (self target slideToggle: 'slow')
		equals: self function , '("div").slideToggle("slow")'.
	self 
		assert: (self target slideToggle: 'fast' callback: 'done')
		equals: self function , '("div").slideToggle("fast",function(){done})'