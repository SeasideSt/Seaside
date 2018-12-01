Class {
	#name : #SUDraggable,
	#superclass : #PTNamed,
	#category : 'Scriptaculous-Core-Dragging'
}

{ #category : #options }
SUDraggable >> constraint: aSymbol [
	"If set to #horizontal or #vertical the drag will be constrained to take place only horizontally or vertically."

	self optionAt: 'constraint' put: aSymbol
]

{ #category : #options }
SUDraggable >> constraintHorizontal [
	self constraint: #horizontal
]

{ #category : #options }
SUDraggable >> constraintVertical [
	self constraint: #vertical
]

{ #category : #private }
SUDraggable >> defaultPrototype [
	^ 'Draggable'
]

{ #category : #options }
SUDraggable >> delay: aDuration [
	self optionAt: 'delay' put: aDuration
]

{ #category : #effects }
SUDraggable >> endEffect: anObject [
	self optionAt: 'endeffect' put: anObject asFunction
]

{ #category : #options }
SUDraggable >> ghosting: aBoolean [
	"Clones the element and drags the clone, leaving the original in place until the clone is dropped."

	self optionAt: 'ghosting' put: aBoolean
]

{ #category : #options }
SUDraggable >> handle: aString [
	"Sets whether the element should only be draggable by an embedded handle. The value must be an element reference or element id."

	self optionAt: 'handle' put: aString
]

{ #category : #initialization }
SUDraggable >> initialize [
	super initialize.
	self create
]

{ #category : #events }
SUDraggable >> onChange: anObject [
	self optionAt: 'change' put: anObject asFunction
]

{ #category : #events }
SUDraggable >> onDrag: anObject [
	self optionAt: 'onDrag' put: anObject asFunction
]

{ #category : #events }
SUDraggable >> onDropped: anObject [
	self optionAt: 'onDropped' put: anObject asFunction
]

{ #category : #events }
SUDraggable >> onEnd: anObject [
	self optionAt: 'onEnd' put: anObject asFunction
]

{ #category : #events }
SUDraggable >> onSnap: anObject [
	self optionAt: 'snap' put: anObject asFunction
]

{ #category : #events }
SUDraggable >> onStart: anObject [
	self optionAt: 'onStart' put: anObject asFunction
]

{ #category : #options }
SUDraggable >> revert: aBoolean [
	"If set to true, the element returns to its original position when the drags ends."

	self optionAt: 'revert' put: aBoolean
]

{ #category : #effects }
SUDraggable >> revertEffect: anObject [
	self optionAt: 'reverteffect' put: anObject asFunction
]

{ #category : #options }
SUDraggable >> scroll: aBoolean [
	self optionAt: 'scroll' put: aBoolean
]

{ #category : #options }
SUDraggable >> scrollSensitivity: anInteger [
	self optionAt: 'scrollSensitivity' put: anInteger
]

{ #category : #options }
SUDraggable >> scrollSpeed: anInteger [
	self optionAt: 'scrollSpeed' put: anInteger
]

{ #category : #options }
SUDraggable >> snap: aBooleanOrPoint [
	"If set to false no snapping occurs. Otherwise takes the forms [x,y]."

	self optionAt: 'snap' put: aBooleanOrPoint
]

{ #category : #effects }
SUDraggable >> startEffect: anObject [
	self optionAt: 'starteffect' put: anObject asFunction
]

{ #category : #options }
SUDraggable >> zindex: anInteger [
	"The css zindex of the draggable item."

	self optionAt: 'zindex' put: anInteger
]
