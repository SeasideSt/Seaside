tests-flush
testFlushNextPutAll
	self response nextPutAll: 'Hello World'. " <-- should flush "
	self assert: self response isCommitted.
	self 
		should: [ self response committedCheck ]
		raise: WAIllegalStateException.
	self assertLines: #('HTTP/1.1 200 OK' '' 'Hello World')