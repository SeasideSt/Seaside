tests
testNoHandlerFoundForKey
	| context notified |
	context := self requestContext.
	notified := false.
	[ strategy
		noHandlerFoundForKey: 'The_Birthday_Massacre'
		in: self newApplication
		context: context ]
		on: WAResponseNotification
		do: [ :notification | notified := true ].
	self assert: notified.
	self assertNotFound: context