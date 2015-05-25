private
assertContentType: aMimeTypeStringOrNil accept: anAcceptStringOrNil routesTo: aSymbol
	| routes headers request context result |
	routes := WAByMethodRoutes routes: (GRPlatform current createRoutesFor: WAMimeTypeStubHandler).
	headers := GRSmallDictionary new.
	aMimeTypeStringOrNil isNil ifFalse: [
		headers at: 'content-type' put: aMimeTypeStringOrNil ].
	anAcceptStringOrNil isNil ifFalse: [
		headers at: 'accept' put: anAcceptStringOrNil ].
	request := (WARequest method: 'GET' uri: 'index')
		setHeaders: headers;
		yourself.
	context := WARequestContext request: request response: WAResponse new.
	result := routes routeForContext: context consume: true ifAbsent: [ self assert: false ].
	self assert: result route selector = aSymbol