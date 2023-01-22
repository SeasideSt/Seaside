testing
testRmoveKey

	cache at: 1 put: '1'.
	cache at: 2 put: '2'.
	self assert: cache size = 2.
	
	self assert: (cache removeKey: 2) = '2'.
	self assert: cache size = 1.
	
	self assert: (cache at: 1 ifAbsent: [ nil ]) = '1'.
	self assert: (cache at: 2 ifAbsent: [ #missing ]) = #missing