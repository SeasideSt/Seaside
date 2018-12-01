Class {
	#name : #WACmdRemoveExpression,
	#superclass : #OBCommand,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #execution }
WACmdRemoveExpression >> execute [
	target removeExpression
]

{ #category : #testing }
WACmdRemoveExpression >> isActive [
	^ (requestor isSelected: target) and: [ target isAttribute ]
]

{ #category : #testing }
WACmdRemoveExpression >> isEnabled [
	^ target isOverride
]

{ #category : #accessing }
WACmdRemoveExpression >> label [
	^ 'Clear value'
]
