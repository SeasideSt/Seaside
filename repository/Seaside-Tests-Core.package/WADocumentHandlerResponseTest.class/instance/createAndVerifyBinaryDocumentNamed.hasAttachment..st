private
createAndVerifyBinaryDocumentNamed: aFilename hasAttachment: aHttpHeaderValue
	self
		createAndVerifyDocumentNamed: aFilename
		content: WATestingFiles default samplePng
		mimeType: WAMimeType imagePng
		hasAttachment: aHttpHeaderValue