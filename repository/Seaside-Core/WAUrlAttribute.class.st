"
WAUrlAttribute represents a URL attribute. It converts between text entered on the configuration page and WAUrl instances.
"
Class {
	#name : #WAUrlAttribute,
	#superclass : #WAAttribute,
	#category : 'Seaside-Core-Configuration'
}

{ #category : #visiting }
WAUrlAttribute >> accept: aVisitor [
	aVisitor visitUrlAttribute: self
]

{ #category : #converting }
WAUrlAttribute >> valueFromString: aString [
	^ aString isEmptyOrNil ifFalse: [ WAUrl absolute: aString ]
]
