tests-utilities
testHoldReady
	self
		assert: (self jQuery holdReady: false)
		equals: self function , '.holdReady(false)'