Class {
	#name : #WAFullMimeTypeMatch,
	#superclass : #WAMimeTypeMatch,
	#instVars : [
		'main',
		'sub'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WAFullMimeTypeMatch class >> main: aMainString sub: aSubString [
	^ self basicNew initializeWithMain: aMainString sub: aSubString
]

{ #category : #initialization }
WAFullMimeTypeMatch >> initializeWithMain: aMainString sub: aSubString [
	self initialize.
	main := aMainString.
	sub := aSubString
]

{ #category : #testing }
WAFullMimeTypeMatch >> matches: aMimeType [
	^ (aMimeType main = '*'
		or: [ aMimeType main = main ])
		and: [
			aMimeType sub = '*'
				or: [ aMimeType sub = sub ] ]
]

{ #category : #printing }
WAFullMimeTypeMatch >> printOn: aStream [
	super printOn: aStream.

	aStream 
		nextPutAll: ' (mimeType: '; print: self seasideMimeType;
		nextPutAll: ' priority: '; print: self priority;
		nextPut: $)
]

{ #category : #accessing }
WAFullMimeTypeMatch >> priority [
	^ 3
]

{ #category : #accessing }
WAFullMimeTypeMatch >> priorityFor: aMimeType [
	^ (aMimeType main = main
		and: [ aMimeType sub = sub ])
			ifTrue: [ self priority ]
			ifFalse: [ -1 ]
]

{ #category : #accessing }
WAFullMimeTypeMatch >> seasideMimeType [
	^ WAMimeType main: main sub: sub
]
