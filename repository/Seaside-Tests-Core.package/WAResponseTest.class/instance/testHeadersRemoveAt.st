tests-headers
testHeadersRemoveAt
	self response headerAt: 'foo' put: 'bar'.
	self response headerAt: 'bar' put: 'baz'.
	self assert: (self response removeHeaderAt: 'foo') = #('bar').
	self assert: (self response removeHeaderAt: 'bar') = #('baz').
	self assert: (self response headers isEmpty)