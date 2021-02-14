"
I work as a container to delegate the rendering to another object.
"
Class {
	#name : #WADelegation,
	#superclass : #WADecoration,
	#instVars : [
		'delegate'
	],
	#category : 'Seaside-Component-Base'
}

{ #category : #visiting }
WADelegation >> accept: aVisitor [
	aVisitor visitDelegation: self
]

{ #category : #hooks }
WADelegation >> children [
	^ Array with: self delegate
]

{ #category : #accessing }
WADelegation >> delegate [
	^ delegate
]

{ #category : #accessing }
WADelegation >> delegate: aComponent [
	delegate := aComponent
]

{ #category : #testing }
WADelegation >> isDelegation [
	^ true
]

{ #category : #rendering }
WADelegation >> renderContentOn: html [
	html render: self delegate
]
