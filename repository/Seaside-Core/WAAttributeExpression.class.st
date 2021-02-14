Class {
	#name : #WAAttributeExpression,
	#superclass : #WAConfigurationElement,
	#category : 'Seaside-Core-Configuration'
}

{ #category : #values }
WAAttributeExpression >> determineValueWithContext: aContext configuration: aConfiguration [
	self subclassResponsibility
]
