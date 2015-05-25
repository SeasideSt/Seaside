tests
testNotFound
	| generator |
	generator := WAResponseGenerator on: self requestContext.
	self requestContext response nextPutAll: 'oops'.
	generator notFound.
	self assertContents: '/ not found'