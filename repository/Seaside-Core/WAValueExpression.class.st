Class {
	#name : #WAValueExpression,
	#superclass : #WAAttributeExpression,
	#instVars : [
		'value'
	],
	#category : 'Seaside-Core-Configuration'
}

{ #category : #values }
WAValueExpression >> determineValueWithContext: aContext configuration: aConfiguration [
	^ self value
]

{ #category : #accessing }
WAValueExpression >> value [
	^ value
]

{ #category : #accessing }
WAValueExpression >> value: anObject [
	value := anObject
]
