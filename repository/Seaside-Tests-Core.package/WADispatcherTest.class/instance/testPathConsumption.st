tests
testPathConsumption
	dispatcher := WADispatcher new.
	handler := dispatcher register: WANextUnconsumedPathElementRequestHandler new at: 'tweets'.
	[ dispatcher handle: self requestContext ]
		on: WAResponseNotification
		do: [ :notification | "everything is fine" ].
	self assert: handler nextUnconsumedPathElement = 'kentbeck'