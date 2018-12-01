Class {
	#name : #WACollectionMimeDocumentTest,
	#superclass : #TestCase,
	#instVars : [
		'document'
	],
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #running }
WACollectionMimeDocumentTest >> setUp [
	super setUp.
	document := WAMimeDocument on: 'aString' mimeType: WAMimeType textPlain
]

{ #category : #tests }
WACollectionMimeDocumentTest >> testAsMIMEDocument [

	self assert: document seasideMimeDocument == document
]

{ #category : #tests }
WACollectionMimeDocumentTest >> testContent [

	self assert: document content = 'aString'
]

{ #category : #tests }
WACollectionMimeDocumentTest >> testContentStream [
	| stream |	
	stream := document contentStream.
	'aString' do: [ :each |
		self deny: stream atEnd.
		self assert: stream next = each ].
	
	self assert: stream atEnd
]
