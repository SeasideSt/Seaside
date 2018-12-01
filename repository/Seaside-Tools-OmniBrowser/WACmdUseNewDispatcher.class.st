Class {
	#name : #WACmdUseNewDispatcher,
	#superclass : #OBCommand,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #execution }
WACmdUseNewDispatcher >> execute [
	| dispatcher |
	(OBConfirmationRequest 
		prompt: 'This will replace all applications on this server instance' 
		confirm: 'Proceed')
			ifFalse: [ ^ nil ].
	dispatcher := WADispatcher new.
	target adaptor requestHandler: dispatcher.
	requestor browser announce: (OBNodeCreated node: dispatcher asNode)
]

{ #category : #testing }
WACmdUseNewDispatcher >> isActive [
	^ requestor isSelected: target
]

{ #category : #accessing }
WACmdUseNewDispatcher >> label [
	^ 'Use new dispatcher'
]
