"
I represent an assignment ot the decorated object.
"
Class {
	#name : 'JSAssignment',
	#superclass : 'JSDecoration',
	#instVars : [
		'object'
	],
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'printing' }
JSAssignment >> javascriptContentOn: aRenderer [
	super javascriptContentOn: aRenderer.
	aRenderer assignment: [ 
		aRenderer render: self object ]
]

{ #category : 'accessing' }
JSAssignment >> object [
	^ object
]

{ #category : 'accessing' }
JSAssignment >> object: anObject [
	object := anObject
]
