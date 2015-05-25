tests-accessing
testAt
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.

	self assert: (merged at: 'foo') = 1.
	self assert: (merged at: 'bar') = 2.
	two at: 'foo' put: 3.
	self assert: (merged at: 'foo') = 1.
	self assert: (merged at: 'zork') isNil
