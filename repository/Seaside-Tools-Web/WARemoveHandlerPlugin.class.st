"
I remove an application.
"
Class {
	#name : #WARemoveHandlerPlugin,
	#superclass : #WAConfigurationToolPlugin,
	#category : 'Seaside-Tools-Web'
}

{ #category : #accessing }
WARemoveHandlerPlugin >> clickScript [
	^ 'return confirm("Really delete ', self handler basicUrl pathStringUnencoded, '?")'
]

{ #category : #actions }
WARemoveHandlerPlugin >> execute [
	| aDispatcher |
	aDispatcher := self handler parent.
	aDispatcher unregister: self handler.
	self requestor configure: aDispatcher
]

{ #category : #testing }
WARemoveHandlerPlugin >> isActive [
	^ self handler notNil and: [ self handler parent notNil ]

]

{ #category : #accessing }
WARemoveHandlerPlugin >> label [
	^ 'Remove'
]

{ #category : #accessing }
WARemoveHandlerPlugin >> priority [
	^ 60
]
