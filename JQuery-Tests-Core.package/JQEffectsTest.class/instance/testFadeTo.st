tests-effects
testFadeTo
	self 
		assert: (self target fade: 1 seconds to: 0.8)
		equals: self function , '("div").fadeTo(1000,0.8)'.
	self 
		assert: (self target fade: 2 seconds to: 0.4 callback: 'done')
		equals: self function , '("div").fadeTo(2000,0.4,function(){done})'