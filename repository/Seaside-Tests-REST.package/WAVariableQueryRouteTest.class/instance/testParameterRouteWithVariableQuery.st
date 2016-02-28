as yet unclassified
testParameterRouteWithVariableQuery
	| handler request fields |
	handler := WAVariableQueryTestRestfulHandler new.
	request := WARequest method: 'GET' uri: 'parameterRouteWithVariableQuery/pathParameter?field1=foo&field2=baz'.
	fields := (WAUrl new parseQuery: (self handleRequest: request) contents) queryFields.
	self assert: fields size equals: 2.
	self assert: (fields at: 'field1') equals: 'foo'.
	self assert: (fields at: 'field2') equals: 'baz'