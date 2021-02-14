Class {
	#name : #WAPharoEncoder,
	#superclass : #WAEncoder,
	#instVars : [
		'table',
		'delegate'
	],
	#classInstVars : [
		'table'
	],
	#category : 'Seaside-Squeak-Core-Document'
}

{ #category : #private }
WAPharoEncoder class >> delegateOn: aStream [
	self subclassResponsibility
]

{ #category : #'instance creation' }
WAPharoEncoder class >> on: aStream [
	^ self basicNew
		initializeOn: aStream
		table: table
		delegate: (self delegateOn: aStream)
]

{ #category : #'instance creation' }
WAPharoEncoder class >> on: aStream codec: aCodec [
	self subclassResponsibility
]

{ #category : #'*seaside-pharo-core-document' }
WAPharoEncoder >> basicNextPut: aCharacter [
	self nextPut: aCharacter
]

{ #category : #'*seaside-pharo-core-document' }
WAPharoEncoder >> basicNextPutAll: anObject [
	self nextPutAll: anObject
]

{ #category : #'*seaside-pharo-core-document' }
WAPharoEncoder >> greaseNext: anInteger putAll: aCollection startingAt: startIndex [
	aCollection isByteString
		ifTrue: [ self greaseNext: anInteger putAllFast: aCollection startingAt: startIndex ]
		ifFalse: [ delegate greaseNext: anInteger putAll: aCollection startingAt: startIndex ]
]

{ #category : #'*seaside-pharo-core-document' }
WAPharoEncoder >> greaseNext: anInteger putAllFast: aByteString startingAt: startIndex [
	| lastIndex nextIndex |
	lastIndex := startIndex.
	nextIndex := ByteString findFirstInString: aByteString inSet: table startingAt: lastIndex.
	(nextIndex = 0 or: [ nextIndex = (startIndex + anInteger) ]) ifTrue: [
		^ stream greaseNext: anInteger putAll: aByteString startingAt: startIndex ].
	[	
		nextIndex >= (startIndex + anInteger) ifTrue: [
			^ stream greaseNext: startIndex + anInteger - nextIndex + 1 putAll: aByteString startingAt: lastIndex ].
		nextIndex > lastIndex ifTrue: [
			stream greaseNext: nextIndex - lastIndex putAll: aByteString startingAt: lastIndex ].
		"let the delegate do the actual encoding"
		delegate nextPut: (aByteString at: nextIndex).
		lastIndex := nextIndex + 1.
		nextIndex := ByteString findFirstInString: aByteString inSet: table startingAt: lastIndex.
		(nextIndex = 0 or: [ nextIndex >= (startIndex + anInteger) ]) ] whileFalse.
	lastIndex >= (startIndex + anInteger) ifFalse: [
		stream greaseNext: startIndex + anInteger - lastIndex putAll: aByteString startingAt: lastIndex ]
]

{ #category : #private }
WAPharoEncoder >> includesUnsafeCharacter: aString [
	^ (ByteString findFirstInString: aString inSet: table startingAt: 1) ~= 0
]

{ #category : #initialization }
WAPharoEncoder >> initializeOn: aStream table: anArray delegate: anEncoder [
	self initializeOn: aStream.
	table := anArray.
	delegate := anEncoder
]

{ #category : #'*seaside-pharo-core-document' }
WAPharoEncoder >> isBinary [
	^ false
]

{ #category : #accessing }
WAPharoEncoder >> nextPut: aCharacter [
	"Don't bother, directly go the the look up table"
	delegate nextPut: aCharacter
]

{ #category : #accessing }
WAPharoEncoder >> nextPutAll: aString [
	aString isByteString
		ifTrue: [ self nextPutAllFast: aString ]
		ifFalse: [
			"slow fall back for WideStrings"
			delegate nextPutAll: aString ]
]

{ #category : #private }
WAPharoEncoder >> nextPutAllFast: aByteString [
	| lastIndex nextIndex |
	lastIndex := 1.
	nextIndex := ByteString findFirstInString: aByteString inSet: table startingAt: lastIndex.
	nextIndex = 0 ifTrue: [ ^ stream nextPutAll: aByteString ].
	[	nextIndex > lastIndex ifTrue: [
			stream greaseNext: nextIndex - lastIndex putAll: aByteString startingAt: lastIndex ].
		"let the delegate do the actual encoding"
		delegate nextPut: (aByteString at: nextIndex).
		lastIndex := nextIndex + 1.
		nextIndex := ByteString findFirstInString: aByteString inSet: table startingAt: lastIndex.
		nextIndex = 0 ] whileFalse.
	stream greaseNext: aByteString size - lastIndex + 1 putAll: aByteString startingAt: lastIndex
]
