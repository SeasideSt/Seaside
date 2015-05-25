tests
testNoHandlerFoundForSessionKey
	| context application cache session |
	context := self requestContext.
	application := self newApplication.
	[ strategy
		noHandlerFoundForKey: self sessionId
		in: application
		context: context ]
		on: WAResponseNotification
		do: [ :notification | "ignore" ].
	self assertOk: context.
	cache := application cache.
	self assert: cache size = 1.
	session := cache at: self sessionId ifAbsent: [ nil ].
	self deny: session isNil.
	self assert: session isSession