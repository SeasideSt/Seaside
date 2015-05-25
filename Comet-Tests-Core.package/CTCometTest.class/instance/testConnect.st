tests
testConnect
	self
		assert: (self comet url: 'http://www.pusher.com/'; connect)
		equals: 'new Comet("http://www.pusher.com/").connect()'