testing
testKeyAtValue
	cache at: 1 put: 'one'.
	self assert: (cache keyAtValue: 'one' ifAbsent: [ 2 ]) equals: 1.
	self assert: (cache keyAtValue: 'two' ifAbsent: [ 2 ]) equals: 2.