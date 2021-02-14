Class {
	#name : #WACmdRemoveHandler,
	#superclass : #OBCommand,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #execution }
WACmdRemoveHandler >> execute [
	target handler parent unregister: target handler.
	requestor browser announce: (OBNodeDeleted node: target)
]

{ #category : #testing }
WACmdRemoveHandler >> isActive [
	^ (requestor isSelected: target) and: [ target isHandler and: [ target handler isRoot not ] ]
]

{ #category : #accessing }
WACmdRemoveHandler >> keystroke [
	^ $x
]

{ #category : #accessing }
WACmdRemoveHandler >> label [
	^ 'Remove'
]
