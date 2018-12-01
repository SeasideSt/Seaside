"
A WADocument combines an output stream and an instance of root. The root is responsible to render header and footer if necessary.
"
Class {
	#name : #WADocument,
	#superclass : #WAObject,
	#instVars : [
		'stream',
		'root'
	],
	#category : 'Seaside-Core-Document'
}

{ #category : #'instance creation' }
WADocument class >> new [
	^ self on: GRPlatform current readWriteCharacterStream
]

{ #category : #'instance creation' }
WADocument class >> on: aStream [ 
	^ self 
		on: aStream
		codec: GRNullCodec new
]

{ #category : #'instance creation' }
WADocument class >> on: aStream codec: aCodec [
	^ self basicNew initializeWithStream: aStream codec: aCodec; yourself
]

{ #category : #actions }
WADocument >> close [
	"Close the receiving document."

	root isNil ifFalse: [ root closeOn: self ]
]

{ #category : #initialization }
WADocument >> destroy [
	stream := root := nil
]

{ #category : #initialization }
WADocument >> initializeWithStream: aStream codec: aCodec [
	self initialize.
	stream := aStream
]

{ #category : #writing }
WADocument >> nextPut: aCharacter [
	stream nextPut: aCharacter
]

{ #category : #writing }
WADocument >> nextPutAll: aString [
	stream nextPutAll: aString
]

{ #category : #actions }
WADocument >> open: aRoot [
	"Open the receiving document with aRoot."

	(root := aRoot) openOn: self
]

{ #category : #accessing }
WADocument >> scriptGenerator: aScriptGenerator [
	"ignore"
]

{ #category : #accessing }
WADocument >> stream [
	"Answer the underlying character stream of this document."

	^ stream
]
