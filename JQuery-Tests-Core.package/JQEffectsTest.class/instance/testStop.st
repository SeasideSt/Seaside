tests
testStop
	self 
		assert: (self target stop)
		equals: self function , '("div").stop()'