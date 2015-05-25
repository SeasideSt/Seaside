tests
testNewSessionCookieDomain
	| context request response cookie |
	request := self requestWithMethod: 'GET'.
	response := WABufferedResponse new.
	context := WARequestContext request: request response: response.
	[ handler handle: context ]
		on: WAResponseNotification
		do: [ :notification | ].
	self assert: response cookies size = 1.
	cookie := response cookies first.
	self assert: cookie domain = 'www.seaside.st'