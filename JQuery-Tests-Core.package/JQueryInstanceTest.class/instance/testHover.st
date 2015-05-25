tests-events
testHover
	self
		assert: ((self jQuery: 'a') hover: 1 out: 2)
		equals: self function , '("a").hover(function(){1},function(){2})'