"
WAPasswordAttribute represents a password attribute. When set from a string, it records a hashed value. On the Seaside configuration page it does not display its current value.

"
Class {
	#name : #WAPasswordAttribute,
	#superclass : #WAAttribute,
	#category : 'Seaside-Core-Configuration'
}

{ #category : #visiting }
WAPasswordAttribute >> accept: aVisitor [
	aVisitor visitPasswordAttribute: self
]

{ #category : #converting }
WAPasswordAttribute >> valueFromString: aString [ 
	^ aString isEmptyOrNil ifFalse: [ GRPlatform current secureHashFor: aString ]
]
