Class {
	#name : #WAPharoXmlEncoder,
	#superclass : #WAPharoEncoder,
	#category : 'Seaside-Squeak-Core-Document'
}

{ #category : #private }
WAPharoXmlEncoder class >> delegateOn: aStream [
	^ WAXmlEncoder on: aStream
]

{ #category : #'class initialization' }
WAPharoXmlEncoder class >> initialize [
	self initializeXmlTable
]

{ #category : #'class initialization' }
WAPharoXmlEncoder class >> initializeXmlTable [
	table := ByteArray new: 256.
	1 to: 256 do: [ :index |
		('"<&>' includes: (Character codePoint: index - 1))
			ifTrue: [ table at: index put: 1 ]
			ifFalse: [ table at: index put: 0 ] ]
]

{ #category : #'instance creation' }
WAPharoXmlEncoder class >> on: aStream codec: aCodec [
	^ self on: aStream
]
