tests
testInternalError
	| generator |
	generator := WAResponseGenerator on: self requestContext.
	self requestContext response nextPutAll: 'oops'.
	[ WATestError signal ]
		on: WATestError
		do: [ :error |
			generator internalError: error ].
	self assertContents: 'Internal Error: '