tests
testGreaseNextPutAllStartingAt
	self
		assert: '$(&quot;#seastar&quot;).animate({&quot;left&quot;:&quot;-=100px&quot;},{})'
		next: 13
		startingAt: 4
		encoder: self xmlEncoderClass
		gives:  'quot;#seastar'.