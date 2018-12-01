Class {
	#name : #WACmdAddHandler,
	#superclass : #OBCommand,
	#instVars : [
		'type'
	],
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #accessing }
WACmdAddHandler class >> instances [
	^ WARequestHandler concreteSubclasses collect: [ :each | self new setType: each ]
]

{ #category : #execution }
WACmdAddHandler >> execute [
	| name handler |
	name := OBTextRequest prompt: 'Entry point name:'.
	(name isNil or: [ name isEmpty ]) ifTrue: [ ^ self ].
	handler := WAAdmin register: type at: name in: target handler.
	handler isApplication ifTrue: [ WAAdmin configureNewApplication: handler ].
	requestor browser announce: (OBNodeCreated node: handler asNode)
]

{ #category : #accessing }
WACmdAddHandler >> group [
	^ #adding
]

{ #category : #testing }
WACmdAddHandler >> isActive [
	^ (requestor isSelected: target) and: [ target isHandler and: [ target canHaveChildren ] ]
]

{ #category : #accessing }
WACmdAddHandler >> label [
	^ 'Add ' , self type description
]

{ #category : #accessing }
WACmdAddHandler >> on: anObject for: aRequestor [
	^ (super on: anObject for: aRequestor) setType: self type
]

{ #category : #initialization }
WACmdAddHandler >> setType: aClass [
	type := aClass
]

{ #category : #accessing }
WACmdAddHandler >> type [
	^ type
]
