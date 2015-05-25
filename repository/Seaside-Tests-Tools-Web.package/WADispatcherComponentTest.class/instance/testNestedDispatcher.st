tests
testNestedDispatcher
	| configComponent |
	configComponent := WAConfigurationBrowser on: rootHandler.
	self requestContextWithUrl: '/config/child'.
	self requestContext consumer next.
	self requestContext session properties at: #presenter put: WAComponent new.
	configComponent initialRequest: self requestContext request.
	self assert: configComponent dispatcher == childHandler