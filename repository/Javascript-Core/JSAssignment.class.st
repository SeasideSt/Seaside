"
I represent an assignment ot the decorated object.
"
Class {
	#name : #JSAssignment,
	#superclass : #JSDecoration,
	#instVars : [
		'object'
	],
	#category : 'Javascript-Core-Decorations'
}

{ #category : #printing }
JSAssignment >> javascriptContentOn: aStream [
	super javascriptContentOn: aStream.
	aStream
		nextPutAll: '=';
		javascript: self object
]

{ #category : #accessing }
JSAssignment >> object [
	^ object
]

{ #category : #accessing }
JSAssignment >> object: anObject [
	object := anObject
]
