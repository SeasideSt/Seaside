"
WAClassListAttribute is an attribute that is restricted to a list of classes. The value will be an instance of the given class created with #new. 
"
Class {
	#name : #WAClassListAttribute,
	#superclass : #WAListAttribute,
	#category : 'Seaside-Core-Configuration'
}

{ #category : #visiting }
WAClassListAttribute >> accept: aVisitor [
	aVisitor visitClassListAttribute: self
]

{ #category : #converting }
WAClassListAttribute >> stringForValue: anObject [
	^ anObject isNil ifFalse: [
		anObject class name greaseString ]
]
