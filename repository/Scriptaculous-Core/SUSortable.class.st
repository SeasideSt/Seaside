Class {
	#name : #SUSortable,
	#superclass : #PTNamed,
	#category : 'Scriptaculous-Core-Dragging'
}

{ #category : #options }
SUSortable >> constraint: aString [
	"If set to #horizontal or #vertical the drag will be constrained to take place only horizontally or vertically."

	self optionAt: 'constraint' put: aString
]

{ #category : #options }
SUSortable >> constraintHorizontal [
	self constraint: #horizontal
]

{ #category : #options }
SUSortable >> constraintVertical [
	self constraint: #vertical
]

{ #category : #options }
SUSortable >> containment: aStringOrArray [
	"Enables dragging and dropping between Sortables. Takes an array of elements or element-ids (of the containers)."

	self optionAt: 'containment' put: aStringOrArray
]

{ #category : #actions }
SUSortable >> create [
	self method: 'create'
]

{ #category : #private }
SUSortable >> defaultMethod [
	^ 'create'
]

{ #category : #private }
SUSortable >> defaultPrototype [
	^ 'Sortable'
]

{ #category : #options }
SUSortable >> delay: aDuration [
	self optionAt: 'delay' put: aDuration
]

{ #category : #actions }
SUSortable >> destroy [
	self method: 'destroy'
]

{ #category : #options }
SUSortable >> dropOnEmpty: aBoolean [
	"If set to true, the Sortable container will be made into a Droppable, that can receive a Draggable (as according to the containment rules) as a child element when there are no more elements inside."

	self optionAt: 'dropOnEmpty' put: aBoolean
]

{ #category : #options }
SUSortable >> format: aString [
	"The format that the id is computed from each item-id."
	
	self optionAt: 'format' put: aString
]

{ #category : #options }
SUSortable >> ghosting: aBoolean [
	"If set to true, dragged elements of the Sortable will e cloned and appear as 'ghost', i.e. a representation of their original element, instead of directly dragging the original element."

	self optionAt: 'ghosting' put: aBoolean
]

{ #category : #options }
SUSortable >> handle: aString [
	"Further restricts the selection of child elements to only encompass elements with the given CSS class (or, if you provide an array of strings, on any of the classes)."

	self optionAt: 'handle' put: aString
]

{ #category : #options }
SUSortable >> hoverclass: aString [
	"Gives the created Droppables a hoverclass."

	self optionAt: 'hoverclass' put: aString
]

{ #category : #initialization }
SUSortable >> initialize [
	super initialize.
	self format: (JSStream on: '/^(.*)$/')
]

{ #category : #events }
SUSortable >> onChange: anObject [
	"Called whenever the sort order changes while dragging. When dragging from one Sortable to another, the callback is called once on each Sortable."

	self optionAt: 'onChange' put: anObject asFunction
]

{ #category : #events }
SUSortable >> onUpdate: anObject [
	"Called when the drag ends and the Sortable's order is changed in any way. When dragging from one Sortable to another, the callback is called once on each Sortable."

	self optionAt: 'onUpdate' put: anObject asFunction
]

{ #category : #options }
SUSortable >> only: aString [
	"Further restricts the selection of child elements to only encompass elements with the given CSS class (or, if you provide an array of strings, on any of the classes)."

	self optionAt: 'only' put: aString
]

{ #category : #options }
SUSortable >> overlap: aSymbol [
	"Either #vertical or #horizontal. For floating sortables or horizontal lists, choose #horizontal. Vertical lists should use #vertical."

	self optionAt: 'overlap' put: aSymbol
]

{ #category : #options }
SUSortable >> overlapHorizontal [
	self overlap: #horizontal
]

{ #category : #options }
SUSortable >> overlapVertical [
	self overlap: #vertical
]

{ #category : #options }
SUSortable >> scroll: aBoolean [
	self optionAt: 'scroll' put: aBoolean
]

{ #category : #options }
SUSortable >> scrollSensitivity: aNumber [
	self optionAt: 'scrollSensitivity' put: aNumber
]

{ #category : #options }
SUSortable >> scrollSpeed: aNumber [
	self optionAt: 'scrollSpeed' put: aNumber
]

{ #category : #actions }
SUSortable >> sequence [
	self method: 'sequence'
]

{ #category : #actions }
SUSortable >> serialize [
	self method: 'serialize'
]

{ #category : #options }
SUSortable >> tag: aString [
	"Sets the kind of tag (of the child elements of the container) that will be made sortable. For UL and OL containers, this is 'LI', you have to provide the tag kind for other sorts of child tags."

	self optionAt: 'tag' put: aString
]

{ #category : #actions }
SUSortable >> tree [
	self method: 'tree_sequence'
]

{ #category : #options }
SUSortable >> tree: aBoolean [
	self optionAt: 'tree' put: aBoolean
]

{ #category : #options }
SUSortable >> treeTag: aString [
	self optionAt: 'treeTag' put: aString
]
