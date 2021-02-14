"
WANumberAttribute represents a number attribute. It converts between text entered on the configuration page and numbers.

"
Class {
	#name : #WANumberAttribute,
	#superclass : #WAAttribute,
	#category : 'Seaside-Core-Configuration'
}

{ #category : #visiting }
WANumberAttribute >> accept: aVisitor [
	aVisitor visitNumberAttribute: self
]

{ #category : #converting }
WANumberAttribute >> valueFromString: aString [
	^ aString isEmptyOrNil ifFalse: [ Number readFrom: aString readStream ]
]
