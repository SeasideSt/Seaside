tests
testDisconnect
	self
		assert: (self comet url: 'http://www.pusher.com/'; disconnect)
		equals: 'new Comet("http://www.pusher.com/").disconnect()'