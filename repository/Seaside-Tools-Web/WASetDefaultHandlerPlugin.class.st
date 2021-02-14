Class {
	#name : #WASetDefaultHandlerPlugin,
	#superclass : #WAConfigurationToolPlugin,
	#category : 'Seaside-Tools-Web'
}

{ #category : #actions }
WASetDefaultHandlerPlugin >> execute [
	self handler parent defaultName: self handler name
]

{ #category : #testing }
WASetDefaultHandlerPlugin >> isActive [
	^ self handler notNil and: [ self handler parent notNil ]

]

{ #category : #accessing }
WASetDefaultHandlerPlugin >> label [
	^ 'Set Default'
]

{ #category : #accessing }
WASetDefaultHandlerPlugin >> priority [
	^ 100
]
