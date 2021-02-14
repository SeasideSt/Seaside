"
WAStringAttribute represents a string attribute. It does the trivial conversion between text entered on the Seaside configuration page and a string.
"
Class {
	#name : #WAStringAttribute,
	#superclass : #WAAttribute,
	#category : 'Seaside-Core-Configuration'
}

{ #category : #visiting }
WAStringAttribute >> accept: aVisitor [
	aVisitor visitStringAttribute: self
]

{ #category : #converting }
WAStringAttribute >> valueFromString: aString [
	^ aString isEmptyOrNil ifFalse: [ aString ]
]
