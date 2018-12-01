"
WABooleanAttribute  represents a boolean attribute. It converts between text entered on the configuration page and boolean values.
"
Class {
	#name : #WABooleanAttribute,
	#superclass : #WAAttribute,
	#category : 'Seaside-Core-Configuration'
}

{ #category : #visiting }
WABooleanAttribute >> accept: aVisitor [
	aVisitor visitBooleanAttribute: self
]

{ #category : #converting }
WABooleanAttribute >> valueFromString: aString [
	^ aString = 'true'
		ifTrue: [ true ]
		ifFalse: [
			aString = 'false'
				 ifTrue: [ false ]
				 ifFalse: [ WAConfigurationError signal: 'Invalid value for boolean attribute' ] ]
]
