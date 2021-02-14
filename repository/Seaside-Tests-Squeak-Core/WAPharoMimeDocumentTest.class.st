Class {
	#name : #WAPharoMimeDocumentTest,
	#superclass : #WAFormTestCase,
	#category : 'Seaside-Tests-Squeak-Core'
}

{ #category : #tests }
WAPharoMimeDocumentTest >> testAsMIMEDocumentForm [
	| form document |
	self formClassExists ifFalse: [ ^ self ].
	
	form := self sampleForm.
	document := form seasideMimeDocument.
	self assert: document contentType = WAMimeType imageGif.
	self assert: (document content isKindOf: ByteArray)
]

{ #category : #tests }
WAPharoMimeDocumentTest >> testAsMIMEDocumentFormColon [
	| form document |
	self formClassExists ifFalse: [ ^ self ].
	
	form := self sampleForm.
	document := form seasideMimeDocumentType: WAMimeType imageJpeg.
	self assert: document contentType = WAMimeType imageJpeg.
	self assert: (document content isKindOf: ByteArray)
]

{ #category : #tests }
WAPharoMimeDocumentTest >> testAsMIMEDocumentFormColonString [
	| form document |
	self formClassExists ifFalse: [ ^ self ].
	form := self sampleForm.
	document := form seasideMimeDocumentType: WAMimeType imageJpeg greaseString.
	self assert: document contentType = WAMimeType imageJpeg.
	self assert: (document content isKindOf: ByteArray)
]

{ #category : #tests }
WAPharoMimeDocumentTest >> testAsMIMEDocumentFormUnknown [
	| form |
	self formClassExists ifFalse: [ ^ self ].
	
	form := self sampleForm.
	self should: [ form seasideMimeDocumentType: 'foo/bar' ] raise: Error.
	self should: [ form seasideMimeDocumentType: 'foo/bar' seasideMimeType ] raise: Error.
	self should: [ form seasideMimeDocumentType: 'image/zork' ] raise: Error.
	self should: [ form seasideMimeDocumentType: 'image/zork' seasideMimeType ] raise: Error
]

{ #category : #tests }
WAPharoMimeDocumentTest >> testAsMIMEDocumentMorph [
	| morph document |
	morph := EllipseMorph new
		color: Color red;
		borderWidth: 1;
		borderColor: Color black;
		extent: 12 @ 12;
		yourself.
	document := morph seasideMimeDocument.
	self assert: document contentType = WAMimeType imageGif.
	self assert: (document content isKindOf: ByteArray)
]

{ #category : #tests }
WAPharoMimeDocumentTest >> testAsMIMEDocumentMorphColol [
	| morph document |
	morph := EllipseMorph new
		color: Color red;
		borderWidth: 1;
		borderColor: Color black;
		extent: 12 @ 12;
		yourself.
	document := morph seasideMimeDocumentType: WAMimeType imageJpeg.
	self assert: document contentType = WAMimeType imageJpeg.
	self assert: (document content isKindOf: ByteArray)
]

{ #category : #tests }
WAPharoMimeDocumentTest >> testAsMIMEDocumentStream [
	| document |
	document := 'dolphin' readStream seasideMimeDocument.
	self assert: document contentType = WAMimeType textPlain.
	self assert: document content = 'dolphin'
]

{ #category : #tests }
WAPharoMimeDocumentTest >> testAsMIMEDocumentStreamColon [
	| document |
	document := 'monkey' readStream seasideMimeDocument.
	document mimeType: 'text/html'.
	self assert: document contentType = WAMimeType textHtml.
	self assert: document content = 'monkey'
]

{ #category : #tests }
WAPharoMimeDocumentTest >> testBinaryStreamSeasideMimeDocumentType [
	| document mpeg |
	mpeg := WAMimeType main: 'audio' sub: 'mpeg'.
	document :=  #(1 2 3 4) asByteArray readStream seasideMimeDocumentType: mpeg.
	self assert: document mimeType = mpeg.
	self assert: document contents = #(1 2 3 4) asByteArray 
]

{ #category : #tests }
WAPharoMimeDocumentTest >> testTextStreamSeasideMimeDocumentType [
	| document csv |
	csv := WAMimeType main: 'text' sub: 'csv'.
	document := 'foo,bar' readStream seasideMimeDocumentType: csv.
	self assert: document mimeType = csv.
	self assert: document contents = 'foo,bar'
]
