tests-effects
testHide
	self 
		assert: (self target hide)
		equals: self function , '("div").hide()'.
	self 
		assert: (self target hide: 'slow')
		equals: self function , '("div").hide("slow")'.
	self 
		assert: (self target hide: 'fast' callback: 'done')
		equals: self function , '("div").hide("fast",function(){done})'