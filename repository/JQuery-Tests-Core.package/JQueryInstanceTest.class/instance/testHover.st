tests-events
testHover
	self
		assert: ((self jQuery: 'a') hover: 1 out: 2)
		equals: self function , '("a").on("mouseenter",function(){1}).on("mouseleave",function(){2})'