tests-animation
testAnimateOptions
	self
		assert: (self animate duration: 5 seconds)
		equals: self function , '("div").animate({},{"duration":5000})'.
	self
		assert: (self animate easing: 'linear')
		equals: self function , '("div").animate({},{"easing":"linear"})'.
	self
		assert: (self animate queue: false)
		equals: self function , '("div").animate({},{"queue":false})'