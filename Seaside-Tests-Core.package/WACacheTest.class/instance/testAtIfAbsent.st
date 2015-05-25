tests
testAtIfAbsent
	self assert: (cache at: key ifAbsent: [ 0 ]) = 0.
	self assert: (cache at: (cache store: 1) ifAbsent: [ 0 ]) = 1