private
assertPerformGetTo: aCollectionOfStrings equals: aCollection contentType: aMimeType
	| requestUrl request response context |
	requestUrl := WAUrl new
		addAllToPath: aCollectionOfStrings;
		yourself.
	request := WARequest
		method: 'GET'
		uri: requestUrl.
	response := WABufferedResponse new.
		
	context := WARequestContext request: request response: response.
	[ handler handle: context ]
		on: WAResponseNotification
		do: [ :n | ].
	
	self assert: response contents = aCollection.
	aMimeType isNil ifFalse: [
		self assert: response contentType = aMimeType.
		self assert: response contentType greaseString = aMimeType greaseString ]