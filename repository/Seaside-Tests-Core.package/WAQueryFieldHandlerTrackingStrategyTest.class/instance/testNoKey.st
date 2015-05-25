tests
testNoKey
	| actual |
	actual := strategy keyFromContext: self requestContext.
	self assert: actual isNil