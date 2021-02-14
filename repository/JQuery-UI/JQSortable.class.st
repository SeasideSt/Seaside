"
Creates new sortable on the nodeset supplied by the query.
"
Class {
	#name : #JQSortable,
	#superclass : #JQWidget,
	#category : 'JQuery-UI-Interaction'
}

{ #category : #'options-generated' }
JQSortable >> appendTo: aString [
	"Defines where the helper that moves with the mouse is being appended to during the drag (for example, to resolve overlap/zIndex issues)."

	self optionAt: 'appendTo' put: aString
]

{ #category : #'options-generated' }
JQSortable >> axis: aString [
	"If defined, the items can be dragged only horizontally or vertically. Possible values:'x', 'y'."

	self optionAt: 'axis' put: aString
]

{ #category : #actions }
JQSortable >> cancel [
	"Cancels a change in the current sortable and reverts it back to how it was before the current sort started. Useful in the stop and receive callback functions."
	
	self action: 'cancel'
]

{ #category : #'options-generated' }
JQSortable >> cancel: aSelector [
	"Prevents sorting if you start on elements matching the selector."

	self optionAt: 'cancel' put: aSelector
]

{ #category : #'options-generated' }
JQSortable >> connectWith: aSelector [
	"Takes a jQuery selector with items that also have sortables applied. If used, the sortable is now connected to the other one-way, so you can drag from this sortable to the other."

	self optionAt: 'connectWith' put: aSelector
]

{ #category : #'options-generated' }
JQSortable >> containment: anElementOrStringOrSelector [
	"Constrains dragging to within the bounds of the specified element - can be a DOM element, 'parent', 'document', 'window', or a jQuery selector. Note: the element specified for containment must have a calculated width and height (though it need not be explicit), so for example, if you have float:left sortable children and specify containment:'parent' be sure to have float:left on the sortable/parent container as well or it will have height: 0, causing undefined behavior."

	self optionAt: 'containment' put: anElementOrStringOrSelector
]

{ #category : #'options-generated' }
JQSortable >> cursor: aString [
	"Defines the cursor that is being shown while sorting."

	self optionAt: 'cursor' put: aString
]

{ #category : #'options-generated' }
JQSortable >> cursorAt: anObject [
	"Moves the sorting element or helper so the cursor always appears to drag from the same position. Coordinates can be given as a hash using a combination of one or two keys: { top, left, right, bottom }."

	self optionAt: 'cursorAt' put: anObject
]

{ #category : #'options-generated' }
JQSortable >> delay: anInteger [
	"Time in milliseconds to define when the sorting should start. It helps preventing unwanted drags when clicking on an element."

	self optionAt: 'delay' put: anInteger
]

{ #category : #'options-generated' }
JQSortable >> distance: anInteger [
	"Tolerance, in pixels, for when sorting should start. If specified, sorting will not start until after mouse is dragged beyond distance. Can be used to allow for clicks on elements within a handle."

	self optionAt: 'distance' put: anInteger
]

{ #category : #'options-generated' }
JQSortable >> dropOnEmpty: aBoolean [
	"If false items from this sortable can't be dropped to an empty linked sortable."

	self optionAt: 'dropOnEmpty' put: aBoolean
]

{ #category : #'options-generated' }
JQSortable >> forceHelperSize: aBoolean [
	"If true, forces the helper to have a size."

	self optionAt: 'forceHelperSize' put: aBoolean
]

{ #category : #'options-generated' }
JQSortable >> forcePlaceholderSize: aBoolean [
	"If true, forces the placeholder to have a size."

	self optionAt: 'forcePlaceholderSize' put: aBoolean
]

{ #category : #'options-generated' }
JQSortable >> grid: anArray [
	"Snaps the sorting element or helper to a grid, every x and y pixels. Array values: [x, y]"

	self optionAt: 'grid' put: anArray
]

{ #category : #'options-generated' }
JQSortable >> handle: aSelectorOrElement [
	"Restricts sort start click to the specified element."

	self optionAt: 'handle' put: aSelectorOrElement
]

{ #category : #'options-generated' }
JQSortable >> helper: aStringOrFunction [
	"Allows for a helper element to be used for dragging display. The supplied function receives the event and the element being sorted, and should return a DOMElement to be used as a custom proxy helper. Possible values: 'original', 'clone'"

	self optionAt: 'helper' put: aStringOrFunction
]

{ #category : #'options-generated' }
JQSortable >> items: aSelector [
	"Specifies which items inside the element should be sortable."

	self optionAt: 'items' put: aSelector
]

{ #category : #accessing }
JQSortable >> method [
	^ 'sortable'
]

{ #category : #'events-generated' }
JQSortable >> onActivate: anObject [
	"This event is triggered when using connected lists, every connected list on drag start receives it."

	self optionAt: 'activate' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSortable >> onBeforeStop: anObject [
	"This event is triggered when sorting stops, but when the placeholder/helper is still available."

	self optionAt: 'beforeStop' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSortable >> onChange: anObject [
	"This event is triggered during sorting, but only when the DOM position has changed."

	self optionAt: 'change' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSortable >> onDeactivate: anObject [
	"This event is triggered when sorting was stopped, is propagated to all possible connected lists."

	self optionAt: 'deactivate' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSortable >> onOut: anObject [
	"This event is triggered when a sortable item is moved away from a connected list."

	self optionAt: 'out' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSortable >> onOver: anObject [
	"This event is triggered when a sortable item is moved into a connected list."

	self optionAt: 'over' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSortable >> onReceive: anObject [
	"This event is triggered when a connected sortable list has received an item from another list."

	self optionAt: 'receive' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSortable >> onRemove: anObject [
	"This event is triggered when a sortable item has been dragged out from the list and into another."

	self optionAt: 'remove' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSortable >> onSort: anObject [
	"This event is triggered during sorting."

	self optionAt: 'sort' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSortable >> onStart: anObject [
	"This event is triggered when sorting starts."

	self optionAt: 'start' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSortable >> onStop: anObject [
	"This event is triggered when sorting has stopped."

	self optionAt: 'stop' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSortable >> onUpdate: anObject [
	"This event is triggered when the user stopped sorting and the DOM position has changed."

	self optionAt: 'update' put: anObject asFunction
]

{ #category : #'options-generated' }
JQSortable >> opacity: aFloat [
	"Defines the opacity of the helper while sorting. From 0.01 to 1"

	self optionAt: 'opacity' put: aFloat
]

{ #category : #'options-generated' }
JQSortable >> placeholder: aString [
	"Class that gets applied to the otherwise white space."

	self optionAt: 'placeholder' put: aString
]

{ #category : #actions }
JQSortable >> refresh [
	"Refresh the sortable items."
	
	self action: 'refresh'
]

{ #category : #actions }
JQSortable >> refreshPositions [
	"Refresh the cached positions of the sortables' items."
	
	self action: 'refreshPositions'
]

{ #category : #'options-generated' }
JQSortable >> revert: aBooleanInteger [
	"If set to true, the item will be reverted to its new DOM position with a smooth animation. Optionally, it can also be set to a number that controls the duration of the animation in ms."

	self optionAt: 'revert' put: aBooleanInteger
]

{ #category : #'options-generated' }
JQSortable >> scroll: aBoolean [
	"If set to true, the page scrolls when coming to an edge."

	self optionAt: 'scroll' put: aBoolean
]

{ #category : #'options-generated' }
JQSortable >> scrollSensitivity: anInteger [
	"Defines how near the mouse must be to an edge to start scrolling."

	self optionAt: 'scrollSensitivity' put: anInteger
]

{ #category : #'options-generated' }
JQSortable >> scrollSpeed: anInteger [
	"The speed at which the window should scroll once the mouse pointer gets within the scrollSensitivity distance."

	self optionAt: 'scrollSpeed' put: anInteger
]

{ #category : #'options-generated' }
JQSortable >> tolerance: aString [
	"This is the way the reordering behaves during drag. Possible values: 'intersect', 'pointer'. In some setups, 'pointer' is more natural.  
''intersect'': draggable overlaps the droppable at least 50% 
''pointer'': mouse pointer overlaps the droppable "

	self optionAt: 'tolerance' put: aString
]
