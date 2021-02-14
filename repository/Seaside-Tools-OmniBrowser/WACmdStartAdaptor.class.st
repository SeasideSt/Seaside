Class {
	#name : #WACmdStartAdaptor,
	#superclass : #OBCommand,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #execution }
WACmdStartAdaptor >> execute [
	self isEnabled ifFalse: [ ^ nil ].
	target start.
	requestor browser signalRefresh
]

{ #category : #testing }
WACmdStartAdaptor >> isActive [
	^ requestor isSelected: target
]

{ #category : #testing }
WACmdStartAdaptor >> isEnabled [
	^ (requestor isSelected: target) and: [ target isServerAdaptor and: [ target canStart ] ]
]

{ #category : #accessing }
WACmdStartAdaptor >> keystroke [
	^ $s
]

{ #category : #accessing }
WACmdStartAdaptor >> label [
	^ 'Start'
]
