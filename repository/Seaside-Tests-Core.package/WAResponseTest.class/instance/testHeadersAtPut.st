tests-headers
testHeadersAtPut
	self assert: (self response headerAt: 'foo' put: 'bar') = 'bar'.
	self assert: (self response headerAt: 'foo') = 'bar'.
	self assert: (self response headerAt: 'foo' put: 'zork') = 'zork'.
	self assert: (self response headerAt: 'foo') = 'zork'.
	self assert: (self response headers size) = 1