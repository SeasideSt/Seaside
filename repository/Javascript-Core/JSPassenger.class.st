Class {
	#name : #JSPassenger,
	#superclass : #WACallback,
	#instVars : [
		'object'
	],
	#category : 'Javascript-Core-Base'
}

{ #category : #evaluation }
JSPassenger >> evaluateWithArgument: anObject [
	self shouldNotImplement
]

{ #category : #testing }
JSPassenger >> isEnabledFor: aRequestContext [
	^ false
]

{ #category : #testing }
JSPassenger >> isPassenger [
	^ true
]

{ #category : #accessing }
JSPassenger >> object [
	^ object
]

{ #category : #initialization }
JSPassenger >> setObject: anObject [
	object := anObject
]
