Class {
	#name : #WAMimeDocumentTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #tests }
WAMimeDocumentTest >> testAsMIMEDocumentByteArray [
	| document content |
	document := #(1 2 3 4) asByteArray seasideMimeDocument.
	self assert: document contentType = WAMimeType applicationOctetStream.
	content := document content.
	self assert: content size = 4.
	self assert: content class = ByteArray.
	1 to: 4 do: [ :index | self assert: (content at: index) = index ]
]

{ #category : #tests }
WAMimeDocumentTest >> testAsMIMEDocumentByteArrayColon [
	| document content |
	document := #(1 2 3 4) asByteArray seasideMimeDocument.
	document mimeType: WAMimeType imageJpeg.
	self assert: document contentType = WAMimeType imageJpeg.
	content := document content.
	self assert: content size = 4.
	self assert: content class = ByteArray.
	1 to: 4 do: [ :index | self assert: (content at: index) = index ]
]

{ #category : #tests }
WAMimeDocumentTest >> testAsMIMEDocumentString [
	| document |
	document := 'hello Seaside' seasideMimeDocument.
	self assert: document contentType = WAMimeType textPlain.
	self assert: document content = 'hello Seaside'
]

{ #category : #tests }
WAMimeDocumentTest >> testAsMIMEDocumentStringColon [
	| document |
	document := 'hello Seaside' seasideMimeDocument.
	document mimeType: 'text/x-weirdo' seasideMimeType.
	self assert: document contentType = 'text/x-weirdo' seasideMimeType.
	self assert: document content = 'hello Seaside'
]

{ #category : #tests }
WAMimeDocumentTest >> testByteArraySeasideMimeDocumentType [
	| document mpeg |
	mpeg := WAMimeType main: 'audio' sub: 'mpeg'.
	document :=  #(1 2 3 4) asByteArray seasideMimeDocumentType: mpeg.
	self assert: document mimeType = mpeg.
	self assert: document contents = #(1 2 3 4) asByteArray 
]

{ #category : #tests }
WAMimeDocumentTest >> testStringSeasideMimeDocumentType [
	| document csv |
	csv := WAMimeType main: 'text' sub: 'csv'.
	document := 'foo,bar' seasideMimeDocumentType: csv.
	self assert: document mimeType = csv.
	self assert: document contents = 'foo,bar'
]
