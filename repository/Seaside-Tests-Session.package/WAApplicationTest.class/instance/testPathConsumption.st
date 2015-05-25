tests
testPathConsumption
	| context request |
	request := self requestWithMethod: 'GET'.
	context := WARequestContext request: request response: WABufferedResponse new.
	context consumer next.
	self assert: context consumer peek = 'oneo'.
	[ handler handle: context ]
		on: WAResponseNotification
		do: [ :notification | ].
	self assert: context consumer peek = 'oneo'