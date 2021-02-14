Class {
	#name : #WAIntegerAttribute,
	#superclass : #WANumberAttribute,
	#category : 'Seaside-Core-Configuration'
}

{ #category : #visiting }
WAIntegerAttribute >> accept: aVisitor [
	aVisitor visitIntegerAttribute: self
]

{ #category : #converting }
WAIntegerAttribute >> valueFromString: aString [ 
	^ aString isEmptyOrNil ifFalse: [ aString greaseInteger ]
]
