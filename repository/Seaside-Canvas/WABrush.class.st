"
I represent a brush to be used on a *WACanvas*.

Instance Variables
	canvas:		The canvas instance I am used with.
	parent:		The parent brush I am used within.
	closed:		Wether I have been closed/flushed yet.
"
Class {
	#name : #WABrush,
	#superclass : #WAObject,
	#instVars : [
		'canvas',
		'parent',
		'closed'
	],
	#category : 'Seaside-Canvas-Base'
}

{ #category : #public }
WABrush >> close [
	"Close and flush the receiver onto the canvas and its associated document."

	closed ifFalse: [ self with: nil ]
]

{ #category : #initialization }
WABrush >> initialize [
	super initialize.
	closed := false
]

{ #category : #private }
WABrush >> labelForSelector: aSymbol of: anObject [
	^ anObject labelForSelector: aSymbol
]

{ #category : #accessing }
WABrush >> parent [
	^ parent
]

{ #category : #initialization }
WABrush >> setParent: aBrush canvas: aCanvas [
	parent := aBrush.
	canvas := aCanvas
]

{ #category : #public }
WABrush >> with: aBlock [
	canvas nest: aBlock.
	closed := true
]
