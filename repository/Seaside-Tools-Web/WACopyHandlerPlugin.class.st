"
I make a copy of an application.
"
Class {
	#name : #WACopyHandlerPlugin,
	#superclass : #WAConfigurationToolPlugin,
	#category : 'Seaside-Tools-Web'
}

{ #category : #actions }
WACopyHandlerPlugin >> execute [
	self requestor 
		show: (WADispatcherCopyPage new handler: self handler; yourself)
		onAnswer: [ :newHandler |
			newHandler isNil 
				ifFalse: [ self requestor configure: newHandler ] ]

]

{ #category : #testing }
WACopyHandlerPlugin >> isActive [
	^ self handler notNil and: [ self handler parent notNil ]

]

{ #category : #accessing }
WACopyHandlerPlugin >> label [
	^ 'Copy'
]

{ #category : #accessing }
WACopyHandlerPlugin >> priority [
	^ 50
]
