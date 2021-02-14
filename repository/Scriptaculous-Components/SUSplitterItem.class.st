Class {
	#name : #SUSplitterItem,
	#superclass : #SURenderableItem,
	#instVars : [
		'min',
		'size'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #initialization }
SUSplitterItem >> initializeOn: aComponent body: anObject [
	super initializeOn: aComponent body: anObject.
	size := '200px'.
	min := 50
]

{ #category : #accessing }
SUSplitterItem >> min [
	^ min
]

{ #category : #accessing }
SUSplitterItem >> min: aNumber [
	min := aNumber
]

{ #category : #accessing }
SUSplitterItem >> size [
	^ size
]

{ #category : #accessing }
SUSplitterItem >> size: aNumber [
	size := aNumber
]
