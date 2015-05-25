tests-animation
testAnimateParams
	self 
		assert: (self animate parameters: Dictionary new)
		equals: self function , '("div").animate({},{})'.
	self
		assert: (self animate width: 200; padding: 50; opacity: 'hide')
		equals: self function , '("div").animate({"width":200,"padding":50,"opacity":"hide"},{})'.
	self
		assert: (self animate height: 'toggle'; left: '+=100')
		equals: self function , '("div").animate({"height":"toggle","left":"+=100"},{})'