"
I am a Pharo specific URL encoder.
"
Class {
	#name : #WAPharoUrlEncoder,
	#superclass : #WAPharoEncoder,
	#category : 'Seaside-Pharo-Core-Document'
}

{ #category : #private }
WAPharoUrlEncoder class >> delegateOn: aStream [
	^ WAUrlEncoder on: aStream
]

{ #category : #'class initialization' }
WAPharoUrlEncoder class >> initialize [
	self initializeUrlTable
]

{ #category : #private }
WAPharoUrlEncoder class >> initializeUrlTable [
	table := ByteArray new: 256.
	1 to: 256 do: [ :index |
		('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~' includes: (Character codePoint: index - 1))
			ifTrue: [ table at: index put: 0 ]
			ifFalse: [ table at: index put: 1 ] ]
]

{ #category : #'instance creation' }
WAPharoUrlEncoder class >> on: aStream codec: aCodec [
	^ aCodec url encoderFor: (self on: aStream)
]
