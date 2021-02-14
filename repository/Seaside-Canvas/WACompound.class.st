"
I am the superclass for stuff that is not html element but you still want to access via the canvas API.
"
Class {
	#name : #WACompound,
	#superclass : #WABrush,
	#instVars : [
		'callbackBlock',
		'value',
		'id',
		'properties'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #private }
WACompound >> addCallback [
	self subclassResponsibility
]

{ #category : #callbacks }
WACompound >> callback: aBlock [
	callbackBlock := aBlock
]

{ #category : #public }
WACompound >> close [
	closed ifTrue: [ ^ self ].
	closed := true.
	self with: nil
]

{ #category : #testing }
WACompound >> hasCallback [
	^ callbackBlock notNil
]

{ #category : #accessing }
WACompound >> id [
	^ id
]

{ #category : #accessing }
WACompound >> id: aString [
	id := aString
]

{ #category : #initialization }
WACompound >> initialize [
	super initialize.
	"do not remove properties, it is used by SeasideAsync"
	properties := Dictionary new
]

{ #category : #callbacks }
WACompound >> on: aSelector of: anObject [ 
	self value: (anObject perform: aSelector).
	self callback: (GRDelayedSend 
			receiver: anObject
			selector: aSelector asMutator)
]

{ #category : #accessing }
WACompound >> value [
	^ value
]

{ #category : #accessing }
WACompound >> value: aValue [
	value := aValue
]

{ #category : #public }
WACompound >> with: anObject [
	anObject isNil
		ifFalse: [ value := anObject ].
	closed := true
]
