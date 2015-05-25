tests-effects
testToggle
	self 
		assert: (self target toggle)
		equals: self function , '("div").toggle()'.
	self 
		assert: (self target toggle: 'slow')
		equals: self function , '("div").toggle("slow")'.
	self 
		assert: (self target toggle: 'fast' callback: 'done')
		equals: self function , '("div").toggle("fast",function(){done})'