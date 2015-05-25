tests-flush
testFlushStream
	self response stream. " <-- should flush "
	self assert: self response isCommitted.
	self 
		should: [ self response committedCheck ]
		raise: WAIllegalStateException.
	self assertLines: #('HTTP/1.1 200 OK' '')