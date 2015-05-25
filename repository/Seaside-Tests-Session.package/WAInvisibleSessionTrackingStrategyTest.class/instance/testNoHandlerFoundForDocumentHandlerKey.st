tests
testNoHandlerFoundForDocumentHandlerKey
	| context notified |
	context := self requestContext.
	strategy
		addKey: 'The_Birthday_Massacre'
		toUrl: context request uri copy.
	notified := false.
	[ strategy
		noHandlerFoundForKey: 'The_Birthday_Massacre'
		in: self newApplication
		context: context ]
		on: WAResponseNotification
		do: [ :notification | notified := true ].
	self assert: notified.
	self assertNotFound: context