Class {
	#name : #SURenderableItem,
	#superclass : #WAObject,
	#instVars : [
		'owner',
		'body'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #'instance creation' }
SURenderableItem class >> on: aComponent body: anObject [
	^ self basicNew initializeOn: aComponent body: anObject
]

{ #category : #accessing }
SURenderableItem >> body [
	^ body
]

{ #category : #initialization }
SURenderableItem >> initializeOn: aComponent body: anObject [
	self initialize.
	owner := aComponent.
	body := anObject
]

{ #category : #testing }
SURenderableItem >> isComponent [
	"Answer true if the body of the receiver is a component, and therefor needs to be registered as a child."

	^ self body isKindOf: WAComponent
]

{ #category : #accessing }
SURenderableItem >> owner [
	^ owner
]

{ #category : #rendering }
SURenderableItem >> renderOn: html [ 
	html render: self body
]
