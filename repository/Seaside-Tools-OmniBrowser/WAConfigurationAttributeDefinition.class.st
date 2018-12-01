Class {
	#name : #WAConfigurationAttributeDefinition,
	#superclass : #OBDefinition,
	#instVars : [
		'attribute',
		'configuration'
	],
	#category : 'Seaside-Tools-OmniBrowser'
}

{ #category : #'instance creation' }
WAConfigurationAttributeDefinition class >> configuration: aConfiguration attribute: anAttribute [
	^ self new
		setConfiguration: aConfiguration attribute: anAttribute;
		yourself
]

{ #category : #updating }
WAConfigurationAttributeDefinition >> setConfiguration: aConfiguration attribute: anAttribute [
	configuration := aConfiguration.
	attribute := anAttribute
]

{ #category : #callbacks }
WAConfigurationAttributeDefinition >> text [
	^ attribute stringForValue: (configuration at: attribute key)
]

{ #category : #callbacks }
WAConfigurationAttributeDefinition >> text: aText [ 
	configuration 
		takeValueFromString: aText greaseString
		forAttribute: attribute.
	^ true
]
