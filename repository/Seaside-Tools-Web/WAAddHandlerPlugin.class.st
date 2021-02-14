Class {
	#name : #WAAddHandlerPlugin,
	#superclass : #WAConfigurationToolPlugin,
	#category : 'Seaside-Tools-Web'
}

{ #category : #actions }
WAAddHandlerPlugin >> execute [
	self requestor 
		show: (WADispatcherAddPage new dispatcher: self requestor dispatcher; yourself)
		onAnswer: [ :newHandler |
			newHandler isNil 
				ifFalse: [ self requestor configure: newHandler ] ]

]

{ #category : #testing }
WAAddHandlerPlugin >> isActive [
	^ self requestor dispatcher notNil
]

{ #category : #accessing }
WAAddHandlerPlugin >> label [
	^ 'Add'
]

{ #category : #accessing }
WAAddHandlerPlugin >> priority [
	^ -100
]
