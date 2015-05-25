tests
testRequestContext
	| context |
	self should: [ WAObject new requestContext ] raise: WARequestContextNotFound.
	
	context := WARequestContext request: nil response: nil.
	WACurrentRequestContext
		use: context
		during: [ self assert: WAObject new requestContext == context ]