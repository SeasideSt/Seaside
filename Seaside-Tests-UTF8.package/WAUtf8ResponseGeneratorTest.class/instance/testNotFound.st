tests
testNotFound
	| generator |
	generator := WAResponseGenerator on: self requestContext.
	self requestContext response nextPutAll: 'oops'.
	generator notFound.
	self assertContents: '/book/', (String with: (Character codePoint: 225) with: (Character codePoint: 269)), ' not found'