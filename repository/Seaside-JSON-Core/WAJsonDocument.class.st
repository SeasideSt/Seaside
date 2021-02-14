"
I add the possibility to generate JSON.
"
Class {
	#name : #WAJsonDocument,
	#superclass : #WADocument,
	#instVars : [
		'jsonEncoder'
	],
	#category : 'Seaside-JSON-Core'
}

{ #category : #writing }
WAJsonDocument >> closeArray [
	stream nextPut: $]
]

{ #category : #writing }
WAJsonDocument >> closeObject [
	stream nextPut: $}
]

{ #category : #initialization }
WAJsonDocument >> initializeWithStream: aStream codec: aCodec [
	super initializeWithStream: aStream codec: aCodec.
	jsonEncoder := GRPlatform current jsonEncoderOn: aStream
]

{ #category : #writing }
WAJsonDocument >> openArray [
	stream nextPut: $[
]

{ #category : #writing }
WAJsonDocument >> openObject [
	stream nextPut: ${
]

{ #category : #writing }
WAJsonDocument >> string: aString [
	stream nextPut: $".
	jsonEncoder nextPutAll: aString.
	stream nextPut: $"
]
