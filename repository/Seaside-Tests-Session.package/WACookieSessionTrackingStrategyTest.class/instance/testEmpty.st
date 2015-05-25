tests
testEmpty
	| key |
	key := strategy keyFromContext: self requestContext.
	self assert: key isNil