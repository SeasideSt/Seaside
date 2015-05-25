tests-headers
testHeadersAt
	self assert: (self response headerAt: 'foo') isNil.
	self response headerAt: 'foo' put: 'bar'.
	self assert: (self response headerAt: 'foo') = 'bar'