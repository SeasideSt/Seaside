Class {
	#name : #JSStatement,
	#superclass : #JSDecoration,
	#instVars : [
		'statement'
	],
	#category : 'Javascript-Core-Decorations'
}

{ #category : #'instance creation' }
JSStatement class >> on: anObject [
	^ self new statement: anObject
]

{ #category : #accessing }
JSStatement >> statement [
	^ statement
]

{ #category : #accessing }
JSStatement >> statement: anObject [
	statement := anObject
]
