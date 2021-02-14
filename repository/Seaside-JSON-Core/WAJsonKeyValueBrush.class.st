Class {
	#name : #WAJsonKeyValueBrush,
	#superclass : #WAJsonElementBrush,
	#instVars : [
		'key'
	],
	#category : 'Seaside-JSON-Core'
}

{ #category : #'instance creation' }
WAJsonKeyValueBrush class >> key: aString [
	^ self basicNew initializeWithKey: aString
]

{ #category : #initialization }
WAJsonKeyValueBrush >> initializeWithKey: aString [
	self initialize.
	key := aString
]

{ #category : #private }
WAJsonKeyValueBrush >> openBrush [
	super openBrush.
	key jsonOn: canvas.
	self document stream nextPutAll: ': '
]
