tests-headers
testHeadersAtIfAbsent
	self assert: (self response headerAt: 'foo' ifAbsent: [ 'zork' ]) = 'zork'.
	self response headerAt: 'foo' put: 'bar'.
	self assert: (self response headerAt: 'foo' ifAbsent: [ 'zork' ]) = 'bar'