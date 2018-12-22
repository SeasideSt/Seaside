tests
testAsMIMEDocumentForm
	| form document |
	self formClassExists ifFalse: [ ^ self ].
	
	form := self sampleForm.
	document := form seasideMimeDocument.
	self assert: document contentType = WAMimeType imagePng.
	self assert: (document content isKindOf: ByteArray)