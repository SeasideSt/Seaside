tests
testUrlFor
	| context request response session url |
	handler class == WARegistry "only WARegistry supports tracking generic request handlers"
		ifFalse: [ ^ self ].
	request := self requestWithMethod: 'GET'.
	request setCookies: (Array with: (WARequestCookie key: '_s' value: 'sessionid')).
	response := WABufferedResponse new.
	session := WASession new.
	
	context := WARequestContext request: request response: response.
	url := WACurrentRequestContext
		use: context
		during: [
			handler register: session.
			session url ].
	self assert: (url queryFields includesKey: '_s').
	request url addField: '_s' value: (url queryFields at: '_s').
		
	[  handler handle: context ]
		on: WAResponseNotification
		do: [ :notification | ].
		
	self assert: response status = 200.
	self assert: (response cookies isEmpty)