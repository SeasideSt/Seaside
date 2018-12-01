Class {
	#name : #WAClearDefaultHandlerPlugin,
	#superclass : #WAConfigurationToolPlugin,
	#category : 'Seaside-Tools-Web'
}

{ #category : #actions }
WAClearDefaultHandlerPlugin >> execute [
	self requestor dispatcher defaultName: nil

]

{ #category : #testing }
WAClearDefaultHandlerPlugin >> isActive [
	^ self requestor dispatcher notNil and: [ self requestor dispatcher defaultName notNil ]
]

{ #category : #accessing }
WAClearDefaultHandlerPlugin >> label [
	^ 'Clear Default'
]

{ #category : #accessing }
WAClearDefaultHandlerPlugin >> priority [
	^ -90
]
