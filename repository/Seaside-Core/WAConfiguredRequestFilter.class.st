Class {
	#name : 'WAConfiguredRequestFilter',
	#superclass : 'WARequestFilter',
	#instVars : [
		'configuration'
	],
	#category : 'Seaside-Core-Filter',
	#package : 'Seaside-Core',
	#tag : 'Filter'
}

{ #category : 'testing' }
WAConfiguredRequestFilter class >> isAbstract [ 

	^ self == WAConfiguredRequestFilter
]

{ #category : 'configuration' }
WAConfiguredRequestFilter >> configuration [
	^ configuration
]

{ #category : 'configuration' }
WAConfiguredRequestFilter >> defaultConfiguration [
	"Return the configuration (normally a new instance of WAUserConfiguration) to be
	used with the Filter upon initialization."
	
	self subclassResponsibility
]

{ #category : 'initialization' }
WAConfiguredRequestFilter >> initialize [
	super initialize.
	configuration := self defaultConfiguration
]
