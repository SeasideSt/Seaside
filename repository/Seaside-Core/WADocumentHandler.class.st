"
WADocumentHandler handles requests for images, text documents and binary files (byte arrays). This class is not normally used directly. A number of WA*Tag classes implement document:mimeType:fileName: which use WADocumentHandler. Given a document, #document:mimeType:fileName: creates a WADocumentHandler for the document, registers the handler with a Registry, and adds the correct url in the tag for the document.

Instance Variables:
	document	<WAMimeDocument>	MIMEDocument object representing this document and mimeType, generates stream used to write document for the response.
"
Class {
	#name : #WADocumentHandler,
	#superclass : #WARequestHandler,
	#instVars : [
		'document'
	],
	#category : 'Seaside-Core-RequestHandling'
}

{ #category : #'instance creation' }
WADocumentHandler class >> document: anObject [
	^ self basicNew initializeOn: anObject seasideMimeDocument; yourself
]

{ #category : #'instance creation' }
WADocumentHandler class >> document: anObject mimeType: aMimeType [
	^ self document: anObject mimeType: aMimeType fileName: nil
]

{ #category : #'instance creation' }
WADocumentHandler class >> document: anObject mimeType: aMimeType fileName: aString [
	| document |
	document := aMimeType isNil
		ifTrue: [ anObject seasideMimeDocument ]
		ifFalse: [ anObject seasideMimeDocumentType: aMimeType ].
	aString isNil
		ifFalse: [ document fileName: aString ].
	^ self document: document
]

{ #category : #comparing }
WADocumentHandler >> = anObject [
	^ self species = anObject species and: [ self document = anObject document ]
]

{ #category : #accessing }
WADocumentHandler >> document [
	^ document
]

{ #category : #handling }
WADocumentHandler >> handleFiltered: aRequestContext [
	aRequestContext respond: [ :response |
		response
			cacheForever;
			document: self document ]
]

{ #category : #comparing }
WADocumentHandler >> hash [
	^ self document hash
]

{ #category : #initialization }
WADocumentHandler >> initializeOn: aDocument [
	self initialize.
	document := aDocument
]

{ #category : #copying }
WADocumentHandler >> postCopy [
	super postCopy.
	document := document copy
]
