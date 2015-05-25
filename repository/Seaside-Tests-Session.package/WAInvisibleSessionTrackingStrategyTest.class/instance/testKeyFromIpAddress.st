tests
testKeyFromIpAddress
	| context actual |
	context := self requestContext.
	actual := strategy keyFromContext: context.
	self assert: actual = self sessionId