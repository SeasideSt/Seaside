tests-data
testQueue
	self
		assert: ((self jQuery: 'button') queue)
		equals: self function , '("button").queue()'.
	self
		assert: ((self jQuery: 'button') queue: 'fx')
		equals: self function , '("button").queue("fx")'.
	self
		assert: ((self jQuery: 'button') queue: 'fx' do: (self jQuery: 'p') hide)
		equals: self function , '("button").queue("fx",function(){' , self function , '("p").hide()})'