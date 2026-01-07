Class {
	#name : 'WAIntegerAttribute',
	#superclass : 'WANumberAttribute',
	#category : 'Seaside-Core-Configuration',
	#package : 'Seaside-Core',
	#tag : 'Configuration'
}

{ #category : 'visiting' }
WAIntegerAttribute >> accept: aVisitor [
	aVisitor visitIntegerAttribute: self
]

{ #category : 'converting' }
WAIntegerAttribute >> valueFromString: aString [ 
	^ aString isEmptyOrNil ifFalse: [ aString greaseInteger ]
]
