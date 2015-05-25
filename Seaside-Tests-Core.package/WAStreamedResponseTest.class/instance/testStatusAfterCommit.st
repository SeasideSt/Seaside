tests-state
testStatusAfterCommit
	self response flush.
	self 
		should: [ self response forbidden ]
		raise: WAIllegalStateException.
	self 
		should: [ self response status: 404 message: 'Almost found' ]
		raise: WAIllegalStateException