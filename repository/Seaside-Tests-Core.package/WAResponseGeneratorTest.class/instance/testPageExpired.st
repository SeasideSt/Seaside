tests
testPageExpired
	| generator |
	generator := WAResponseGenerator on: self requestContext.
	self requestContext response nextPutAll: 'oops'.
	generator pageExpired.
	self assertContents: 'This page has expired, please use the back-button to navigate to the last valid page.'