Class {
	#name : #WAGemStoneMimeDocumentTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-GemStone-Core'
}

{ #category : #tests }
WAGemStoneMimeDocumentTest >> testAsMIMEDocumentStream [
	| document |
	document := 'dolphin' readStream seasideMimeDocument.
	self assert: document contentType = WAMimeType textPlain.
	self assert: document content = 'dolphin'
]

{ #category : #tests }
WAGemStoneMimeDocumentTest >> testAsMIMEDocumentStreamColon [
	| document |
	document := 'monkey' readStream seasideMimeDocument.
	document mimeType: 'text/html'.
	self assert: document contentType = WAMimeType textHtml.
	self assert: document content = 'monkey'
]
