tests
testNotImplemented
	| context request |
	#('OPTIONS' 'HEAD' 'PUT' 'DELETE' 'TRACE' 'CONNECT') do: [ :each |
		request := self requestWithMethod: each.
		context := WARequestContext request: request response: WABufferedResponse new.
		[ handler handle: context ]
			on: WAResponseNotification
			do: [ :notification | ].
		self assert: context response status = 501 ].
	
	#('GET' 'POST') do: [ :each |
		request := self requestWithMethod: each.
		context := WARequestContext request: request response: WABufferedResponse new.
		[ handler handle: context ]
			on: WAResponseNotification
			do: [ :notification | ].
		self assert: context response status ~= 501 ]