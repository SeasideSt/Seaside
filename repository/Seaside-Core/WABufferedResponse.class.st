"
A WABufferedResponse is a concrete implementation of a HTTP response. Its contentsStream is used to represent the body of the message.

Instance Variables
	contentsStream:		<WriteStream> The contents of this message.
"
Class {
	#name : #WABufferedResponse,
	#superclass : #WAResponse,
	#instVars : [
		'contentsStream'
	],
	#category : 'Seaside-Core-HTTP'
}

{ #category : #'instance creation' }
WABufferedResponse class >> new [
	^ self on: (GRPlatform current writeCharacterStreamOn: (String new: 4096))
]

{ #category : #'instance creation' }
WABufferedResponse class >> on: aStream [
	^ self basicNew initializeOn: aStream
]

{ #category : #streaming }
WABufferedResponse >> binary [
	"put the response stream into binary mode. For buffered response, 
	 replace the contentStream with a ByteArray based stream."
	contentsStream := GRPlatform current readWriteByteStream
]

{ #category : #accessing }
WABufferedResponse >> contents [
	^ contentsStream contents
]

{ #category : #initialization }
WABufferedResponse >> destroy [
	super destroy.
	contentsStream := nil
]

{ #category : #initialization }
WABufferedResponse >> initializeOn: aStream [
	super initializeOn: aStream.
	contentsStream := aStream
]

{ #category : #convenience }
WABufferedResponse >> resetIfPossible [
	self initializeFields.
	contentsStream reset.
	^ true
]

{ #category : #accessing }
WABufferedResponse >> stream [
	^ contentsStream
]

{ #category : #writing }
WABufferedResponse >> writeContentOn: aStream [ 
	aStream nextPutAll: self contents
]

{ #category : #writing }
WABufferedResponse >> writeHeadersOn: aStream [ 
	self 
		headerAt: 'Content-Length'
		put: contentsStream position.
	super writeHeadersOn: aStream
]
