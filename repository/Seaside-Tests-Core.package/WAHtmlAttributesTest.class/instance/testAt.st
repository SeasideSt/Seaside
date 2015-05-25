tests
testAt
	attributes at: 'foo' put: 'bar'.
	self assert: (attributes at: 'foo') = 'bar'.
	self assert: (attributes at: 'bar') isNil