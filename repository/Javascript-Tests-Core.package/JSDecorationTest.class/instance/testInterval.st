tests
testInterval
	self
		assert: (self mock interval: 2 seconds)
		equals: 'setInterval(function(){mock},2000)'