tests
testPathUnconsumedWhenNotFound
	| requestUrl request context notFound |
	requestUrl := WAUrl new
		addAllToPath: #('I' 'can' 'not' 'be' 'found');
		yourself.
	request := WARequest
		method: 'GET'
		uri: requestUrl.
	context := WARequestContext request: request response: WAResponse new.
	notFound := false.
	routes routeForContext: context consume: true ifAbsent: [ notFound := true ].
	self assert: notFound.
	self deny: context consumer atEnd.
	self assert: context consumer upToEnd = #('I' 'can' 'not' 'be' 'found') asOrderedCollection