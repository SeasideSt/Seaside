tests-effects
testShow
	self 
		assert: (self target show)
		equals: self function , '("div").show()'.
	self 
		assert: (self target show: 'slow')
		equals: self function , '("div").show("slow")'.
	self 
		assert: (self target show: 'fast' callback: 'done')
		equals: self function , '("div").show("fast",function(){done})'