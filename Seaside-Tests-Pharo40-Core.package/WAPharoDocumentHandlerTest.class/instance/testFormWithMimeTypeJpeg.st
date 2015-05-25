tests
testFormWithMimeTypeJpeg
	"Test that requesting a form as JPEG actually results in a JPEG"
	| handler |
	self formClassExists ifFalse: [ ^ self ].
	
	handler := WADocumentHandler
		document: self sampleForm
		mimeType: WAMimeType imageJpeg
		fileName: nil.
	
	self assert: (handler document contents beginsWithSubCollection: #(16rFF 16rD8 16rFF 16rE0) asByteArray) "JPEG Magic number"