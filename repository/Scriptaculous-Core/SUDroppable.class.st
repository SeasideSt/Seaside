Class {
	#name : #SUDroppable,
	#superclass : #PTNamed,
	#category : 'Scriptaculous-Core-Dragging'
}

{ #category : #options }
SUDroppable >> accept: aStringOrArray [
	"Set accept to a string or an array of strings describing CSS classes. The Droppable will only accept Draggables that have one or more of these CSS classes."

	self optionAt: 'accept' put: aStringOrArray
]

{ #category : #actions }
SUDroppable >> add [
	"To make an element react when a Draggable is dropped onto it."

	self method: 'add'
]

{ #category : #options }
SUDroppable >> containment: aStringOrArray [
	"The droppable will only accept the Draggable if the Draggable is contained in the given elements (or element ids). Can be a single element or an array of elements."

	self optionAt: 'containment' put: aStringOrArray
]

{ #category : #private }
SUDroppable >> defaultMethod [
	^ 'add'
]

{ #category : #private }
SUDroppable >> defaultPrototype [
	^ 'Droppables'
]

{ #category : #options }
SUDroppable >> greedy: aBoolean [
	"If true stops processing hovering (don't look for other Droppables that are under the Draggable)."

	self optionAt: 'greedy' put: aBoolean
]

{ #category : #options }
SUDroppable >> hoverclass: aString [
	"If set, the Droppable will have this additional CSS class when an accepted Draggable is hovered over it."

	self optionAt: 'hoverclass' put: aString
]

{ #category : #events }
SUDroppable >> onDrop: anObject [
	"Called whenever a Draggable is released over the Droppable and the Droppable is accepts it."

	self optionAt: 'onDrop' put: anObject asFunction
]

{ #category : #events }
SUDroppable >> onHover: anObject [
	"Called whenever a Draggable is moved over the Droppable and the Droppable is affected (would accept it). The callback gets 2 parameters, the passenger of the draggable and the percentage of overlapping as defined by the overlap option."

	self optionAt: 'onHover' put: anObject asFunction
]

{ #category : #options }
SUDroppable >> overlap: aString [
	"If set to 'horizontal' or 'vertical' the droppable will only react to a Draggable if its overlapping by more than 50% in the given direction."

	self optionAt: 'overlap' put: aString
]

{ #category : #options }
SUDroppable >> overlapHorizontal [
	self overlap: 'horizontal'
]

{ #category : #options }
SUDroppable >> overlapVertical [
	self overlap: 'vertical'
]

{ #category : #actions }
SUDroppable >> remove [
	"Remove any droppable capabilities from element."

	self method: 'remove'
]
