"
A WAStreamedResponse is a HTTP response that directly writes to an external write stream. This response class is used to implement efficient HTTP response streaming, as it can directly write do the socket while content is still generated.

Instance Variables
	committed:		<Boolean>	Whether the status and header was written to the stream.
	externalStream:		<WriteStream>	The external stream to write to.
"
Class {
	#name : #WAStreamedResponse,
	#superclass : #WAResponse,
	#instVars : [
		'committed',
		'externalStream'
	],
	#category : 'Seaside-Core-HTTP'
}

{ #category : #'instance creation' }
WAStreamedResponse class >> on: aStream [
	^ self basicNew initializeOn: aStream
]

{ #category : #'accessing-cookies' }
WAStreamedResponse >> addCookie: aCookie [
	self committedCheck.
	^ super addCookie: aCookie
]

{ #category : #streaming }
WAStreamedResponse >> binary [
	"put the response stream into binary mode"

	externalStream binary
]

{ #category : #private }
WAStreamedResponse >> committedCheck [
	"Raises a signal if this response is already committed."

	self isCommitted 
		ifTrue: [ WAIllegalStateException signal ]
]

{ #category : #initialization }
WAStreamedResponse >> destroy [
	super destroy.
	externalStream := nil
]

{ #category : #public }
WAStreamedResponse >> flush [
	"Flush the status code and header fields, if they haven't been written yet."

	self isCommitted
		ifFalse: [ self writeOn: externalStream ].
	externalStream flush
]

{ #category : #'accessing-headers' }
WAStreamedResponse >> headerAt: aString append: aValue [
	self committedCheck.
	^ super headerAt: aString append: aValue
]

{ #category : #'accessing-headers' }
WAStreamedResponse >> headerAt: aString put: aValue [
	self committedCheck.
	^ super headerAt: aString put: aValue
]

{ #category : #initialization }
WAStreamedResponse >> initializeOn: aStream [ 
	super initializeOn: aStream.
	committed := false.
	externalStream := aStream
]

{ #category : #testing }
WAStreamedResponse >> isCommitted [
	^ committed
]

{ #category : #testing }
WAStreamedResponse >> isStreamingResponse [
	"Return true if the receiver supports partial stream responses."

	^ true
]

{ #category : #'accessing-headers' }
WAStreamedResponse >> removeHeaderAt: aString [
	self committedCheck.
	^ super removeHeaderAt: aString
]

{ #category : #convenience }
WAStreamedResponse >> resetIfPossible [
	^ self isCommitted not and: [
		"Reset only if not committed.
		Stream does not have to be reset because it isn't committed yet.
		(it couldn't be reset anyway because it's a SocketStream)"
		super resetIfPossible  ]
]

{ #category : #'accessing-status' }
WAStreamedResponse >> status: aNumber message: aString [
	self committedCheck.
	super status: aNumber message: aString
]

{ #category : #accessing }
WAStreamedResponse >> stream [
	self flush.
	^ externalStream
]

{ #category : #writing }
WAStreamedResponse >> writeContentOn: aStream [ 
	committed := true
]
