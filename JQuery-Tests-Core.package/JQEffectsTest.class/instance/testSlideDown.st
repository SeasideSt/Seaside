tests-effects
testSlideDown
	self 
		assert: (self target slideDown: 'slow')
		equals: self function , '("div").slideDown("slow")'.
	self 
		assert: (self target slideDown: 'fast' callback: 'done')
		equals: self function , '("div").slideDown("fast",function(){done})'