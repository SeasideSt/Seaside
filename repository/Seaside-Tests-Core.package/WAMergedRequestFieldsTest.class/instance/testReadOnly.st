tests
testReadOnly
	self
		should: [ merged at: 'foo' put: 1 ]
		raise: Error.
	self
		should: [ merged at: 'foo' ifAbsentPut: [ 1 ] ]
		raise: Error.
	self
		should: [ merged removeKey: 'foo' ]
		raise: Error
		