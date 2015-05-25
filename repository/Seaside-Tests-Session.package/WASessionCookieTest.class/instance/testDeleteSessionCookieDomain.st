tests
testDeleteSessionCookieDomain
	| context request response cookie |
	request := self requestWithMethod: 'GET'.
	request setCookies: (Array with: (WARequestCookie key: '_s' value: 'goner')).
	response := WABufferedResponse new.
	context := WARequestContext request: request response: response.
	[ handler handle: context ]
		on: WAResponseNotification
		do: [ :notification | ].
	self assert: response status = 302. "session gone"
	self assert: response cookies size = 1.
	cookie := response cookies first.
	self assert: cookie domain = 'www.seaside.st'