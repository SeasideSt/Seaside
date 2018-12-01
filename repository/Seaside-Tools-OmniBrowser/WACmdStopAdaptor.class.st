Class {
	#name : #WACmdStopAdaptor,
	#superclass : #OBCommand,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #execution }
WACmdStopAdaptor >> execute [
	self isEnabled ifFalse: [ ^ nil ].
	target stop.
	requestor browser signalRefresh
]

{ #category : #testing }
WACmdStopAdaptor >> isActive [
	^ requestor isSelected: target
]

{ #category : #testing }
WACmdStopAdaptor >> isEnabled [
	^ (requestor isSelected: target) and: [ target isServerAdaptor and: [ target canStop ] ]
]

{ #category : #accessing }
WACmdStopAdaptor >> keystroke [
	^ $s
]

{ #category : #accessing }
WACmdStopAdaptor >> label [
	^ 'Stop'
]
