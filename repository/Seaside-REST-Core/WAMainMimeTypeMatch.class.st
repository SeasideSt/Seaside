Class {
	#name : #WAMainMimeTypeMatch,
	#superclass : #WAMimeTypeMatch,
	#instVars : [
		'main'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WAMainMimeTypeMatch class >> main: aMainString [
	^ self basicNew initializeWithMain: aMainString
]

{ #category : #initialization }
WAMainMimeTypeMatch >> initializeWithMain: aMainString [
	self initialize.
	main := aMainString
]

{ #category : #testing }
WAMainMimeTypeMatch >> matches: aMimeType [
	^ aMimeType main = '*' or: [ aMimeType main = main ]
]

{ #category : #printing }
WAMainMimeTypeMatch >> printOn: aStream [
	super printOn: aStream.

	aStream 
		nextPutAll: ' (mimeType: '; print: (WAMimeType main: main sub: '*');
		nextPutAll: ' priority: '; print: self priority;
		nextPut: $)
]

{ #category : #accessing }
WAMainMimeTypeMatch >> priority [
	^ 2
]

{ #category : #accessing }
WAMainMimeTypeMatch >> priorityFor: aMimeType [
	^ aMimeType main = main
			ifTrue: [ self priority ]
			ifFalse: [ -1 ]
]
