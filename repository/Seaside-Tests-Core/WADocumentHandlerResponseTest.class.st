Class {
	#name : #WADocumentHandlerResponseTest,
	#superclass : #WAContextTest,
	#category : 'Seaside-Tests-Core-RequestHandling'
}

{ #category : #private }
WADocumentHandlerResponseTest >> assertHttpResponseFrom: aResponse matches: aHandler [
	| expectedContents actualContents |
	self assert: aResponse status = 200.
	self assert: aResponse contentType = aHandler document mimeType.
	expectedContents := aHandler document contents.
	actualContents := aResponse contents.
	self assert: actualContents size = expectedContents size.
	self assert: actualContents species = expectedContents species.
	self assert: aResponse cookies isEmpty
]

{ #category : #private }
WADocumentHandlerResponseTest >> createAndVerifyBinaryDocumentNamed: aFilename hasAttachment: aHttpHeaderValue [
	self
		createAndVerifyDocumentNamed: aFilename
		content: WATestingFiles default samplePng
		mimeType: WAMimeType imagePng
		hasAttachment: aHttpHeaderValue
]

{ #category : #private }
WADocumentHandlerResponseTest >> createAndVerifyDocumentNamed: aFilename content: anObject mimeType: aMimeTypeString hasAttachment: aHttpHeaderValue [
	| handler response |
	handler := WADocumentHandler
		document: anObject
		mimeType: aMimeTypeString
		fileName: aFilename.
	self assert: handler document contents = anObject.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assert: (self headerAt: 'Expires' forResponse: response) notNil.
	self assert: (self headerAt: 'Content-Disposition' forResponse: response) = aHttpHeaderValue.
	self assertHttpResponseFrom: response matches: handler
]

{ #category : #private }
WADocumentHandlerResponseTest >> createAndVerifyTextDocumentNamed: aFilename hasAttachment: aHttpHeaderValue [
	self
		createAndVerifyDocumentNamed: aFilename
		content: 'body { background-color: #ffffff }'
		mimeType: WAMimeType textCss
		hasAttachment: aHttpHeaderValue
]

{ #category : #private }
WADocumentHandlerResponseTest >> headerAt: aString forResponse: aResponse [
	^ aResponse headerAt: aString
]

{ #category : #tests }
WADocumentHandlerResponseTest >> testByteArrayWithFilename [
	self
		createAndVerifyBinaryDocumentNamed: 'sample.png'
		hasAttachment: 'attachment; filename="sample.png"'
]

{ #category : #tests }
WADocumentHandlerResponseTest >> testByteArrayWithoutFilename [
	self
		createAndVerifyBinaryDocumentNamed: nil
		hasAttachment: nil
]

{ #category : #tests }
WADocumentHandlerResponseTest >> testStringWithFilename [
	self
		createAndVerifyTextDocumentNamed: 'toolbar.css'
		hasAttachment: 'attachment; filename="toolbar.css"'
]

{ #category : #tests }
WADocumentHandlerResponseTest >> testStringWithoutFilename [
	self
		createAndVerifyTextDocumentNamed: nil
		hasAttachment: nil
]
