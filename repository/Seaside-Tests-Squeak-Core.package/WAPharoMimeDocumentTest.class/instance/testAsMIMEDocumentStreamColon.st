tests
testAsMIMEDocumentStreamColon
	| document |
	document := 'monkey' readStream seasideMimeDocument.
	document mimeType: 'text/html'.
	self assert: document contentType = WAMimeType textHtml.
	self assert: document content = 'monkey'