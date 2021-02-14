Class {
	#name : #WASharedConfiguration,
	#superclass : #WAUserConfiguration,
	#instVars : [
		'name'
	],
	#classInstVars : [
		'instances'
	],
	#category : 'Seaside-Core-Configuration'
}

{ #category : #accessing }
WASharedConfiguration class >> configurations [
	^ instances copy
]

{ #category : #initialization }
WASharedConfiguration class >> initialize [
	instances isNil ifTrue: [
		instances := Set new ]
]

{ #category : #'instance creation' }
WASharedConfiguration class >> named: aString [
	"Answer a shared configuration with the given name aString or answer a newly created one."
	
	^ instances
		detect: [ :each | each name = aString ]
		ifNone: [
			instances add: (self basicNew
				initializeWithName: aString;
				yourself) ]
]

{ #category : #'instance creation' }
WASharedConfiguration class >> new [
	self error: 'Create or retrieve shared configurations by sending the message #named:'
]

{ #category : #'instance creation' }
WASharedConfiguration class >> unregister: aConfiguration [
	"Removes aConfiguration from the list of known configurations."
	
	^ instances remove: aConfiguration ifAbsent: [ nil ]
]

{ #category : #initialization }
WASharedConfiguration >> initializeWithName: aString [
	self initialize.
	name := aString
]

{ #category : #testing }
WASharedConfiguration >> isShared [
	^ true
]

{ #category : #accessing }
WASharedConfiguration >> name [
	^ name
]

{ #category : #actions }
WASharedConfiguration >> unregister [
	self class unregister: self
]
