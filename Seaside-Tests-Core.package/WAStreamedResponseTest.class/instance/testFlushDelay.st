tests-flush
testFlushDelay
	self response forbidden.
	self response headerAt: 'X-Application-Server' put: 'Seaside'.
	self deny: self response isCommitted.
	self 
		shouldnt: [ self response committedCheck ]
		raise: WAIllegalStateException