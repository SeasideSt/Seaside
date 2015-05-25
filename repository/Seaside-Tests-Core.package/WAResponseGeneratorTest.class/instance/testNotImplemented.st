tests
testNotImplemented
	| generator |
	generator := WAResponseGenerator on: self requestContext.
	self requestContext response nextPutAll: 'oops'.
	generator notImplemented.
	self assertContents:  'Not Implemented'