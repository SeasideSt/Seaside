"
WAMimeDocument is the abstract base class for mime documents. It is intended as a very basic, mime documents. Implementations are free to use more advance, native implementations as long as they conform to the protocol.

Instance Variables
	contentType:		<WAMimeType>

mimeType
	- the mime type of this document

"
Class {
	#name : #WAMimeDocument,
	#superclass : #WAObject,
	#instVars : [
		'contents',
		'mimeType',
		'fileName'
	],
	#category : 'Seaside-Core-HTTP'
}

{ #category : #'instance creation' }
WAMimeDocument class >> on: aCollection [
	^ self on: aCollection mimeType: nil
]

{ #category : #'instance creation' }
WAMimeDocument class >> on: aCollection mimeType: aMimeType [
	^ self on: aCollection mimeType: aMimeType fileName: nil
]

{ #category : #'instance creation' }
WAMimeDocument class >> on: aCollection mimeType: aMimeType fileName: aString [
	^ self basicNew initializeOn: aCollection mimeType: aMimeType fileName: aString; yourself
]

{ #category : #comparing }
WAMimeDocument >> = anObject [
	^ (anObject isKindOf: WAMimeDocument)
		and: [ self mimeType = anObject mimeType
		and: [ self fileName = anObject fileName
		and: [ self contents = anObject contents ] ] ]
]

{ #category : #compatibility }
WAMimeDocument >> content [
	^ self contents
]

{ #category : #compatibility }
WAMimeDocument >> contentStream [
	^ self contents readStream
]

{ #category : #compatibility }
WAMimeDocument >> contentType [
	^ self mimeType
]

{ #category : #accessing }
WAMimeDocument >> contents [
	"Answer the content of the receiver as a Collection of Characters or bytes."
	
	^ contents
]

{ #category : #accessing }
WAMimeDocument >> contents: aCollection [
	contents := aCollection
]

{ #category : #accessing }
WAMimeDocument >> fileName [
	"Answer the file name of this document, or nil."
	
	^ fileName
]

{ #category : #accessing }
WAMimeDocument >> fileName: aString [
	fileName := aString
]

{ #category : #comparing }
WAMimeDocument >> hash [
	^ (self mimeType hash
		bitXor: self fileName hash)
		bitXor: self contents hash
]

{ #category : #initialization }
WAMimeDocument >> initializeOn: aCollection mimeType: aMimeType fileName: aString [
	self initialize.
	self contents: aCollection.
	self mimeType: aMimeType.
	self fileName: aString
]

{ #category : #accessing }
WAMimeDocument >> mimeType [
	"Answer the file name of this document, or nil."
	
	^ mimeType
]

{ #category : #accessing }
WAMimeDocument >> mimeType: aMimeType [
	mimeType := aMimeType isNil
		ifFalse: [ aMimeType seasideMimeType ]
		ifTrue: [ WAMimeType applicationOctetStream ]
]

{ #category : #converting }
WAMimeDocument >> seasideMimeDocument [
	^ self
]
