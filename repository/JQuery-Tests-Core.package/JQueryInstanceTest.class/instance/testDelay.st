tests-effects
testDelay
	self
		assert: ((self jQuery: 'a') delay: 1)
		equals: self function , '("a").delay(1)'.
	self
		assert: ((self jQuery: 'a') delay: 2 queue: 'name')
		equals: self function , '("a").delay(2,"name")'