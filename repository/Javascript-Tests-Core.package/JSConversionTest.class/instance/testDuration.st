tests
testDuration
	self assert: (Duration seconds: 1) equals: '1000'.
	self assert: (Duration milliseconds: 1200) equals: '1200'