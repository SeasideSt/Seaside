private
assertMethod: aMethodString selector: aSymbol path: aFirstCollectionOfStrings parameters: aDictionary arguments: aSecondCollectionOfStrings
	| result stub requestUrl request context |
	requestUrl := WAUrl new
		addAllToPath: aFirstCollectionOfStrings;
		queryFields: aDictionary;
		yourself.
	request := WARequest
		method: aMethodString
		uri: requestUrl.
	context := WARequestContext request: request response: WAResponse new.
	result := routes routeForContext: context consume: true ifAbsent: [ self assert: false ].
	stub := WAByMethodRoutesStub new.
	result sendMessageTo: stub.
	self assert: stub selector = aSymbol.
	self assert: stub arguments = aSecondCollectionOfStrings.
	self assert: context consumer atEnd