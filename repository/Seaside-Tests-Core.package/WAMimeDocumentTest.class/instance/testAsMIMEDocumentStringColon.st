tests
testAsMIMEDocumentStringColon
	| document |
	document := 'hello Seaside' seasideMimeDocument.
	document mimeType: 'text/x-weirdo' seasideMimeType.
	self assert: document contentType = 'text/x-weirdo' seasideMimeType.
	self assert: document content = 'hello Seaside'