testing
testRedirectNoSsl
	| context request response |
	request := WARequest method: 'GET' uri: '/login.do?username=admin'.
	request headers at: 'host' put: 'bank.com'.
	response := WABufferedResponse new.
	self deny: request isSsl.
	
	context := WARequestContext request: request response: response.
	[  filter handleFiltered: context ]
		on: WAResponseNotification
		do: [ :notification | ].
		
	self assert: response status = WAResponse statusFound.
	self assert: ((response headerAt: 'Location') beginsWithSubCollection: 'https://')