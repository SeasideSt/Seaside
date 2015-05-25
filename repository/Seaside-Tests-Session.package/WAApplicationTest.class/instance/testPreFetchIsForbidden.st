tests
testPreFetchIsForbidden
	| context request |

	request := self requestWithMethod: 'GET'.
	request headers at: 'x-moz' put: 'prefetch'. "turn it into a prefetch request"
	self assert: request isPrefetch.
		
	context := WARequestContext request: request response: WABufferedResponse new.
	[ handler handle: context ]
		on: WAResponseNotification
		do: [ :notification | "ignore" ].
	self assert: context response status = WAResponse statusForbidden