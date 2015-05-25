tests-effects
testFadeOut
	self 
		assert: (self target fadeOut: 5 seconds)
		equals: self function , '("div").fadeOut(5000)'.
	self 
		assert: (self target fadeOut: 6 seconds callback: 'done')
		equals: self function , '("div").fadeOut(6000,function(){done})'