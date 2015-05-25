initialization
initializeWithRequest: aRequest response: aResponse codec: aCodec
	self initialize.
	handlers := OrderedCollection new.
	request := aRequest.
	response := aResponse.
	codec := aCodec.
	aRequest isNil ifFalse: [
		consumer := WAPathConsumer path: aRequest url path copy ]