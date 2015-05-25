tests-state
testHeaderAfterCommit
	self response flush.
	self 
		should: [ self response headerAt: 'foo' put: 'bar' ]
		raise: WAIllegalStateException.
	self 
		should: [ self response headerAt: 'foo' append: 'bar' ]
		raise: WAIllegalStateException.
	self 
		should: [ self response removeHeaderAt: 'foo' ]
		raise: WAIllegalStateException