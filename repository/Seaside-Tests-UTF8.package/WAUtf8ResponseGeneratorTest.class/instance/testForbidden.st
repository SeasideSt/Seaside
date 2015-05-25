tests
testForbidden
	| generator |
	generator := WAResponseGenerator on: self requestContext.
	self requestContext response nextPutAll: 'oops'.
	generator forbidden.
	self assertContents: 'Error: you are forbidden to access "/book/', (String with: (Character codePoint: 225) with: (Character codePoint: 269)), '"'