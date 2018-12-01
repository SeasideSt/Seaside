Class {
	#name : #WAAttributeNode,
	#superclass : #WANode,
	#instVars : [
		'configuration',
		'attribute'
	],
	#category : 'Seaside-Tools-OmniBrowser'
}

{ #category : #'instance creation' }
WAAttributeNode class >> configuration: aConfiguration attribute: anAttribute [
	^ self new setConfiguration: aConfiguration attribute: anAttribute
]

{ #category : #accessing }
WAAttributeNode >> attribute [
	^ attribute
]

{ #category : #accessing }
WAAttributeNode >> configuration [
	^ configuration
]

{ #category : #accessing }
WAAttributeNode >> default [
	^ self attribute default
]

{ #category : #public }
WAAttributeNode >> definition [
	^ WAConfigurationAttributeDefinition configuration: configuration attribute: attribute
]

{ #category : #testing }
WAAttributeNode >> isAbstract [
	"True if the attribute is locally defined and there is no default"
	^ self isLocal and: [ self default isNil ]
]

{ #category : #testing }
WAAttributeNode >> isAttribute [
	^ true
]

{ #category : #testing }
WAAttributeNode >> isLocal [ 
	"True if the attribute is defined on this configuration"
	self configuration localAttributeAt: self attribute key ifAbsent: [ ^ false ].
	^ true
]

{ #category : #testing }
WAAttributeNode >> isOverridden [
	^ false
]

{ #category : #testing }
WAAttributeNode >> isOverride [
	"Returns true if there is a value for the attribute on this configuration"
	^ self configuration hasExpressionAt: self attribute key
]

{ #category : #public }
WAAttributeNode >> name [
	^ attribute key
]

{ #category : #actions }
WAAttributeNode >> removeExpression [
	self configuration removeExpressionAt: self attribute key
]

{ #category : #initialization }
WAAttributeNode >> setConfiguration: aConfiguration attribute: anAttribute [
	configuration := aConfiguration.
	attribute := anAttribute
]
