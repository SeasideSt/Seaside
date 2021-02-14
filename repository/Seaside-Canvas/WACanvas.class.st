"
This is the superclass of all canvas. It's a rendering interface that generates brushes (see WABrush).

Subclass WAXmlCanvas, if you want to generate an XML dialect.
"
Class {
	#name : #WACanvas,
	#superclass : #WARenderer,
	#instVars : [
		'currentBrush',
		'parentBrush'
	],
	#category : 'Seaside-Canvas-Canvas'
}

{ #category : #public }
WACanvas >> brush: aBrush [
	self flush.
	currentBrush := aBrush.
	aBrush setParent: parentBrush canvas: self.
	^ aBrush
]

{ #category : #private }
WACanvas >> flush [
	super flush.
	currentBrush isNil
		ifTrue: [ ^ self ].
	currentBrush close.
	currentBrush := nil
]

{ #category : #private }
WACanvas >> insert: aBlock [
	| oldBrush |
	oldBrush := currentBrush.
	currentBrush := nil.
	aBlock value.
	self flush.
	currentBrush := oldBrush
]

{ #category : #private }
WACanvas >> nest: aBlock [
	parentBrush := currentBrush.
	currentBrush := nil.
	self render: aBlock.
	self flush.
	parentBrush := parentBrush parent
]

{ #category : #public }
WACanvas >> render: anObject [
	self flush.
	super render: anObject
]

{ #category : #public }
WACanvas >> text: anObject [
	self flush.
	super text: anObject
]
