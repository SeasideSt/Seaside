Class {
	#name : #WACmdInspectAdaptor,
	#superclass : #OBCommand,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #execution }
WACmdInspectAdaptor >> execute [
	target inspectAdaptor
]

{ #category : #testing }
WACmdInspectAdaptor >> isActive [
	^ requestor isSelected: target
]

{ #category : #accessing }
WACmdInspectAdaptor >> keystroke [
	^ $i
]

{ #category : #accessing }
WACmdInspectAdaptor >> label [
	^ 'Inspect'
]
