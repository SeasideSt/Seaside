"
I encode everything that is written to myself using #nextPut: and #nextPutAll: onto the wrapped stream.
"
Class {
	#name : #WAEncoder,
	#superclass : #WAObject,
	#instVars : [
		'stream'
	],
	#category : 'Seaside-Core-Document'
}

{ #category : #'instance creation' }
WAEncoder class >> on: aStream [
	^ self basicNew initializeOn: aStream
]

{ #category : #initialization }
WAEncoder >> initializeOn: aStream [
	self initialize.
	stream := aStream
]

{ #category : #accessing }
WAEncoder >> nextPut: aCharacter [ 
	self subclassResponsibility
]

{ #category : #accessing }
WAEncoder >> nextPutAll: aString [
	self subclassResponsibility
]
