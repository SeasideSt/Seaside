"
Creates new droppables on the nodeset supplied by the query.
"
Class {
	#name : #JQDroppable,
	#superclass : #JQWidget,
	#category : 'JQuery-UI-Interaction'
}

{ #category : #'options-generated' }
JQDroppable >> accept: aSelectorOrFunction [
	"All draggables that match the selector will be accepted. If a function is specified, the function will be called for each draggable on the page (passed as the first argument to the function), to provide a custom filter. The function should return true if the draggable should be accepted."

	self optionAt: 'accept' put: aSelectorOrFunction
]

{ #category : #'options-generated' }
JQDroppable >> activeClass: aString [
	"If specified, the class will be added to the droppable while an acceptable draggable is being dragged."

	self optionAt: 'activeClass' put: aString
]

{ #category : #'options-generated' }
JQDroppable >> addClasses: aBoolean [
	"If set to false, will prevent the ui-droppable class from being added. This may be desired as a performance optimization when calling .droppable() init on many hundreds of elements."

	self optionAt: 'addClasses' put: aBoolean
]

{ #category : #'options-generated' }
JQDroppable >> greedy: aBoolean [
	"If true, will prevent event propagation on nested droppables."

	self optionAt: 'greedy' put: aBoolean
]

{ #category : #'options-generated' }
JQDroppable >> hoverClass: aString [
	"If specified, the class will be added to the droppable while an acceptable draggable is being hovered."

	self optionAt: 'hoverClass' put: aString
]

{ #category : #accessing }
JQDroppable >> method [
	^ 'droppable'
]

{ #category : #'events-generated' }
JQDroppable >> onActivate: anObject [
	"This event is triggered any time an accepted draggable starts dragging. This can be useful if you want to make the droppable 'light up' when it can be dropped on."

	self optionAt: 'activate' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDroppable >> onDeactivate: anObject [
	"This event is triggered any time an accepted draggable stops dragging."

	self optionAt: 'deactivate' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDroppable >> onDrop: anObject [
	"This event is triggered when an accepted draggable is dropped 'over' (within the tolerance of) this droppable. In the callback, $(this) represents the droppable the draggable is dropped on. ui.draggable represents the draggable."

	self optionAt: 'drop' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDroppable >> onOut: anObject [
	"This event is triggered when an accepted draggable is dragged out (within the tolerance of) this droppable."

	self optionAt: 'out' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDroppable >> onOver: anObject [
	"This event is triggered as an accepted draggable is dragged 'over' (within the tolerance of) this droppable."

	self optionAt: 'over' put: anObject asFunction
]

{ #category : #'options-generated' }
JQDroppable >> scope: aString [
	"Used to group sets of draggable and droppable items, in addition to droppable's accept option. A draggable with the same scope value as a droppable will be accepted."

	self optionAt: 'scope' put: aString
]

{ #category : #'options-generated' }
JQDroppable >> tolerance: aString [
	"Specifies which mode to use for testing whether a draggable is 'over' a droppable. Possible values: 'fit', 'intersect', 'pointer', 'touch'.  
''fit'': draggable overlaps the droppable entirely 
''intersect'': draggable overlaps the droppable at least 50% 
''pointer'': mouse pointer overlaps the droppable 
''touch'': draggable overlaps the droppable any amount "

	self optionAt: 'tolerance' put: aString
]
