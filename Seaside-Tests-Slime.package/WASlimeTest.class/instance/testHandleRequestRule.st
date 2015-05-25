tests-transform
testHandleRequestRule
	| class |
	class := self
		defineClass: #WASlimeMockHandler
		superclass: #WARequestHandler.
	self compile: 'handleRequest: aRequest aRequest notFound' in: class.
	self 
		runTransformation: WAHandleRequestRule
		changes: #('handleFiltered: aRequestContext aRequestContext request notFound')