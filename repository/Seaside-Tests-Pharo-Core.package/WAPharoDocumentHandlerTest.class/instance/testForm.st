tests
testForm
	| handler context |
	self formClassExists ifFalse: [ ^ self ].
	
	handler := WADocumentHandler
		document: self sampleForm
		mimeType: self sampleForm defaultMimeType
		fileName: nil.
	
	context := WARequestContext request: WARequest new response: WABufferedResponse new.
	[ handler handle: context ] on: WAResponseNotification do: [ :n | ].
	
	self assert: context response notNil