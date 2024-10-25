testing
testClear
	cache at: 1 put: 'one'.
	cache clear.
	self assert: (cache at: 1 ifAbsent: [ 'two' ]) equals: 'two'.