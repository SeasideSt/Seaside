tests
testFormWithoutMimeType
	"Test that requesting a form without a mime type works"
	| handler |
	self formClassExists ifFalse: [ ^ self ].
	
	handler := WADocumentHandler
		document: self sampleForm
		mimeType: nil
		fileName: nil.
	
	self assert: handler document contents isEmptyOrNil not