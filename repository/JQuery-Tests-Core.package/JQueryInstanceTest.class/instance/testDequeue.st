tests-data
testDequeue
	self
		assert: ((self jQuery: 'div') dequeue)
		equals: self function , '("div").dequeue()'.
	self
		assert: ((self jQuery: 'div') dequeue: 'fx')
		equals: self function , '("div").dequeue("fx")'