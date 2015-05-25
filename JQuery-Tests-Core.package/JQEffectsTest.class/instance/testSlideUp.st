tests-effects
testSlideUp
	self 
		assert: (self target slideUp: 'slow')
		equals: self function , '("div").slideUp("slow")'.
	self 
		assert: (self target slideUp: 'fast' callback: 'done')
		equals: self function , '("div").slideUp("fast",function(){done})'