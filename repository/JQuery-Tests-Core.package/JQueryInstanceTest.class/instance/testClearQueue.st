tests-effects
testClearQueue
	self
		assert: ((self jQuery: 'a') clearQueue)
		equals: self function , '("a").clearQueue()'.
	self
		assert: ((self jQuery: 'a') clearQueue: 'name')
		equals: self function , '("a").clearQueue("name")'