Class {
	#name : #WADocumentHandlerTest,
	#superclass : #WARequestHandlerTest,
	#category : 'Seaside-Tests-Core-RequestHandling'
}

{ #category : #private }
WADocumentHandlerTest >> newHandler [
	^ WADocumentHandler
		document: 'body { background-color: #ffffff }'
		mimeType: WAMimeType textCss
		fileName: 'sample.css'
]

{ #category : #tests }
WADocumentHandlerTest >> testCopyDocumentHandler [
	| copy |
	copy := handler copy.
	self assert: copy = handler.
	self deny: copy == handler.
	self assert: copy document = handler document.
	self deny: copy document == handler document
]
