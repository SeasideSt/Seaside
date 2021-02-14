Class {
	#name : #WACmdRemoveAdaptor,
	#superclass : #OBCommand,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #execution }
WACmdRemoveAdaptor >> execute [
	target remove.
	requestor browser announce: (OBNodeDeleted node: target)
]

{ #category : #accessing }
WACmdRemoveAdaptor >> group [
	^ #changing
]

{ #category : #testing }
WACmdRemoveAdaptor >> isActive [
	^ requestor isSelected: target
]

{ #category : #testing }
WACmdRemoveAdaptor >> isEnabled [
	^ (requestor isSelected: target) and: [ target canRemove ]
]

{ #category : #accessing }
WACmdRemoveAdaptor >> keystroke [
	^ $x
]

{ #category : #accessing }
WACmdRemoveAdaptor >> label [
	^ 'Remove adaptor'
]
