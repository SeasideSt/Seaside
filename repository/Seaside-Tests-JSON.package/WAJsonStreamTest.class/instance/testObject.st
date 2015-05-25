tests
testObject
	self
		should: [ Object new asJson ]
		raise: Error