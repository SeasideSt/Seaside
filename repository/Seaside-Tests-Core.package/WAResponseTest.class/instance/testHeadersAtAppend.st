tests-headers
testHeadersAtAppend
	self assert: (self response headerAt: 'foo' append: 'bar') = 'bar'.
	self assert: (self response headerAt: 'foo') = 'bar'.
	self assert: (self response headerAt: 'foo' append: 'zork') = 'zork'.
	self assert: (self response headerAt: 'foo') = 'bar'.
	self assert: (self response headers size) = 2