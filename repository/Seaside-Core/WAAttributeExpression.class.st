Class {
	#name : 'WAAttributeExpression',
	#superclass : 'WAConfigurationElement',
	#category : 'Seaside-Core-Configuration',
	#package : 'Seaside-Core',
	#tag : 'Configuration'
}

{ #category : 'values' }
WAAttributeExpression >> determineValueWithContext: aContext configuration: aConfiguration [
	self subclassResponsibility
]
