as yet unclassified
testRouteWithNoQUery
	| handler request fields |
	handler := WAVariableQueryTestRestfulHandler new.
	request := WARequest method: 'GET' uri: 'routeWithNoQuery'.
	fields := (WAUrl new parseQuery: (self handleRequest: request) contents) queryFields.
	self assert: fields size equals: 0