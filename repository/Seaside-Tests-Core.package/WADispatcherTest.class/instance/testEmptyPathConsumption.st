tests
testEmptyPathConsumption
	| root |
	root := WADispatcher new.
	dispatcher := root register: WADispatcher new at: 'tweets'.
	handler := dispatcher register: WANextUnconsumedPathElementRequestHandler new at: 'kentbeck'.
	[ root handle: self requestContext ]
		on: WAResponseNotification
		do: [ :notification | "everything is fine" ].
	self assert: handler nextUnconsumedPathElement isNil