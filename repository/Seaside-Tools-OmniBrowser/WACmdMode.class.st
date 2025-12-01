Class {
	#name : 'WACmdMode',
	#superclass : 'OBCommand',
	#category : 'Seaside-Tools-OmniBrowser-Commands',
	#package : 'Seaside-Tools-OmniBrowser',
	#tag : 'Commands'
}

{ #category : 'testing' }
WACmdMode >> cluster [
	^ #Mode
]

{ #category : 'testing' }
WACmdMode >> isActive [
	^ (requestor isSelected: target) and: [ target canChangeMode ]
]

{ #category : 'testing' }
WACmdMode >> isEnabled [
	^ (requestor isSelected: target) and: [ target canChangeMode ]
]

{ #category : 'testing' }
WACmdMode >> label [
	^ 'Mode'
]
