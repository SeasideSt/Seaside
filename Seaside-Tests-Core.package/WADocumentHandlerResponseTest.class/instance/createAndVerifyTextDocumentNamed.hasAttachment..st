private
createAndVerifyTextDocumentNamed: aFilename hasAttachment: aHttpHeaderValue
	self
		createAndVerifyDocumentNamed: aFilename
		content: 'body { background-color: #ffffff }'
		mimeType: WAMimeType textCss
		hasAttachment: aHttpHeaderValue