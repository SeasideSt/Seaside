tests
testAsMIMEDocumentStream
	| document |
	document := 'dolphin' readStream seasideMimeDocument.
	self assert: document contentType = WAMimeType textPlain.
	self assert: document content = 'dolphin'