Class {
	#name : #WABlockMimeDocumentTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #tests }
WABlockMimeDocumentTest >> testAsMIMEDocumentByteArray [
	| document content |
	document := WABlockMimeDocument onBlock: [ #(1 2 3 4) asByteArray ].
	self assert: document contentType = WAMimeType applicationOctetStream.
	content := document content.
	self assert: content size = 4.
	self assert: content class = ByteArray.
	1 to: 4 do: [ :index | self assert: (content at: index) = index ]
]

{ #category : #tests }
WABlockMimeDocumentTest >> testAsMIMEDocumentByteArrayColon [
	| document content |
	document := WABlockMimeDocument onBlock: [ #(1 2 3 4) asByteArray ].
	document mimeType: WAMimeType imageJpeg.
	self assert: document contentType = WAMimeType imageJpeg.
	content := document content.
	self assert: content size = 4.
	self assert: content class = ByteArray.
	1 to: 4 do: [ :index | self assert: (content at: index) = index ]
]

{ #category : #tests }
WABlockMimeDocumentTest >> testAsMIMEDocumentString [
	| document |
	document := (WABlockMimeDocument onBlock: [ 'hello Seaside' ])
		mimeType: WAMimeType textPlain;
		yourself.
	self assert: document contentType = WAMimeType textPlain.
	self assert: document content = 'hello Seaside'
]

{ #category : #tests }
WABlockMimeDocumentTest >> testAsMIMEDocumentStringColon [
	| document |
	document := WABlockMimeDocument onBlock: [ 'hello Seaside' ].
	document mimeType: 'text/x-weirdo' seasideMimeType.
	self assert: document contentType = 'text/x-weirdo' seasideMimeType.
	self assert: document content = 'hello Seaside'
]

{ #category : #tests }
WABlockMimeDocumentTest >> testByteArraySeasideMimeDocumentType [
	| document mpeg |
	mpeg := WAMimeType main: 'audio' sub: 'mpeg'.
	document :=  (WABlockMimeDocument onBlock: [ #(1 2 3 4) asByteArray ]) seasideMimeDocumentType: mpeg.
	self assert: document mimeType = mpeg.
	self assert: document contents = #(1 2 3 4) asByteArray 
]

{ #category : #tests }
WABlockMimeDocumentTest >> testStringSeasideMimeDocumentType [
	| document csv |
	csv := WAMimeType main: 'text' sub: 'csv'.
	document := (WABlockMimeDocument onBlock: [ 'foo,bar' ]) seasideMimeDocumentType: csv.
	self assert: document mimeType = csv.
	self assert: document contents = 'foo,bar'
]
