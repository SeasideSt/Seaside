"
I decorate JavaScript objects.
"
Class {
	#name : #JSDecoration,
	#superclass : #WAObject,
	#instVars : [
		'owner'
	],
	#category : 'Javascript-Core-Decorations'
}

{ #category : #testing }
JSDecoration >> isJavascript [
	^ true
]

{ #category : #printing }
JSDecoration >> javascriptContentOn: aStream [
	self owner javascriptContentOn: aStream
]

{ #category : #accessing }
JSDecoration >> owner [
	^ owner
]

{ #category : #accessing }
JSDecoration >> renderContext [
	^ owner renderContext
]

{ #category : #initialization }
JSDecoration >> setOwner: anObject [
	owner := anObject
]
