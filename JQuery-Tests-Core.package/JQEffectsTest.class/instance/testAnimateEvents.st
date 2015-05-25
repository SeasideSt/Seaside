tests-animation
testAnimateEvents
	self
		assert: (self animate onComplete: self mock)
		equals: self function , '("div").animate({},{"complete":function(){mock}})'.
	self
		assert: (self animate onStep: self mock)
		equals: self function , '("div").animate({},{"step":function(){mock}})'