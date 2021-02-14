Class {
	#name : #WASubMimeTypeMatch,
	#superclass : #WAMimeTypeMatch,
	#instVars : [
		'sub'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WASubMimeTypeMatch class >> sub: aSubString [
	^ self basicNew initializeWithSub: aSubString
]

{ #category : #initialization }
WASubMimeTypeMatch >> initializeWithSub: aSubString [
	self initialize.
	sub := aSubString
]

{ #category : #testing }
WASubMimeTypeMatch >> matches: aMimeType [
	^ aMimeType sub = '*' or: [ aMimeType sub = sub ]
]

{ #category : #printing }
WASubMimeTypeMatch >> printOn: aStream [
	super printOn: aStream.

	aStream 
		nextPutAll: ' (mimeType: '; print: (WAMimeType main: '*' sub: sub);
		nextPutAll: ' priority: '; print: self priority;
		nextPut: $)
]

{ #category : #accessing }
WASubMimeTypeMatch >> priority [
	^ 2
]

{ #category : #accessing }
WASubMimeTypeMatch >> priorityFor: aMimeType [
	^ aMimeType sub = sub
			ifTrue: [ self priority ]
			ifFalse: [ -1 ]
]
