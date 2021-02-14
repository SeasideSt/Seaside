"
Creates new draggables on the nodeset supplied by the query.
"
Class {
	#name : #JQDraggable,
	#superclass : #JQWidget,
	#category : 'JQuery-UI-Interaction'
}

{ #category : #'options-generated' }
JQDraggable >> addClasses: aBoolean [
	"If set to false, will prevent the ui-draggable class from being added. This may be desired as a performance optimization when calling .draggable() init on many hundreds of elements."

	self optionAt: 'addClasses' put: aBoolean
]

{ #category : #'options-generated' }
JQDraggable >> appendTo: anElementOrSelector [
	"The element passed to or selected by the appendTo option will be used as the draggable helper's container during dragging. By default, the helper is appended to the same container as the draggable."

	self optionAt: 'appendTo' put: anElementOrSelector
]

{ #category : #'options-generated' }
JQDraggable >> axis: aString [
	"Constrains dragging to either the horizontal (x) or vertical (y) axis. Possible values: 'x', 'y'."

	self optionAt: 'axis' put: aString
]

{ #category : #'options-generated' }
JQDraggable >> cancel: aSelector [
	"Prevents dragging from starting on specified elements."

	self optionAt: 'cancel' put: aSelector
]

{ #category : #'options-generated' }
JQDraggable >> connectToSortable: aSelector [
	"Allows the draggable to be dropped onto the specified sortables. If this option is used (helper must be set to 'clone' in order to work flawlessly), a draggable can be dropped onto a sortable list and then becomes part of it. Note: Specifying this option as an array of selectors has been removed."

	self optionAt: 'connectToSortable' put: aSelector
]

{ #category : #'options-generated' }
JQDraggable >> containment: aSelectorOrElementOrStringOrArray [
	"Constrains dragging to within the bounds of the specified element or region. Possible string values: 'parent', 'document', 'window', [x1, y1, x2, y2]."

	self optionAt: 'containment' put: aSelectorOrElementOrStringOrArray
]

{ #category : #'options-generated' }
JQDraggable >> cursor: aString [
	"The css cursor during the drag operation."

	self optionAt: 'cursor' put: aString
]

{ #category : #'options-generated' }
JQDraggable >> cursorAt: anObject [
	"Sets the offset of the dragging helper relative to the mouse cursor. Coordinates can be given as a hash using a combination of one or two keys: { top, left, right, bottom }."

	self optionAt: 'cursorAt' put: anObject
]

{ #category : #'options-generated' }
JQDraggable >> delay: anInteger [
	"Time in milliseconds after mousedown until dragging should start. This option can be used to prevent unwanted drags when clicking on an element."

	self optionAt: 'delay' put: anInteger
]

{ #category : #'options-generated' }
JQDraggable >> distance: anInteger [
	"Distance in pixels after mousedown the mouse must move before dragging should start. This option can be used to prevent unwanted drags when clicking on an element."

	self optionAt: 'distance' put: anInteger
]

{ #category : #'options-generated' }
JQDraggable >> grid: anArray [
	"Snaps the dragging helper to a grid, every x and y pixels. Array values: [x, y]"

	self optionAt: 'grid' put: anArray
]

{ #category : #'options-generated' }
JQDraggable >> handle: anElementOrSelector [
	"If specified, restricts drag start click to the specified element(s)."

	self optionAt: 'handle' put: anElementOrSelector
]

{ #category : #'options-generated' }
JQDraggable >> helper: aStringOrFunction [
	"Allows for a helper element to be used for dragging display. Possible values: 'original', 'clone', Function. If a function is specified, it must return a DOMElement."

	self optionAt: 'helper' put: aStringOrFunction
]

{ #category : #'options-generated' }
JQDraggable >> iframeFix: aBooleanOrSelector [
	"Prevent iframes from capturing the mousemove events during a drag. Useful in combination with cursorAt, or in any case, if the mouse cursor is not over the helper. If set to true, transparent overlays will be placed over all iframes on the page. If a selector is supplied, the matched iframes will have an overlay placed over them."

	self optionAt: 'iframeFix' put: aBooleanOrSelector
]

{ #category : #accessing }
JQDraggable >> method [
	^ 'draggable'
]

{ #category : #'events-generated' }
JQDraggable >> onDrag: anObject [
	"This event is triggered when the mouse is moved during the dragging."

	self optionAt: 'drag' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDraggable >> onStart: anObject [
	"This event is triggered when dragging starts."

	self optionAt: 'start' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDraggable >> onStop: anObject [
	"This event is triggered when dragging stops."

	self optionAt: 'stop' put: anObject asFunction
]

{ #category : #'options-generated' }
JQDraggable >> opacity: aFloat [
	"Opacity for the helper while being dragged."

	self optionAt: 'opacity' put: aFloat
]

{ #category : #'options-generated' }
JQDraggable >> refreshPositions: aBoolean [
	"If set to true, all droppable positions are calculated on every mousemove. Caution: This solves issues on highly dynamic pages, but dramatically decreases performance."

	self optionAt: 'refreshPositions' put: aBoolean
]

{ #category : #'options-generated' }
JQDraggable >> revert: aBooleanOrString [
	"If set to true, the element will return to its start position when dragging stops. Possible string values: 'valid', 'invalid'. If set to invalid, revert will only occur if the draggable has not been dropped on a droppable. For valid, it's the other way around."

	self optionAt: 'revert' put: aBooleanOrString
]

{ #category : #'options-generated' }
JQDraggable >> revertDuration: anInteger [
	"The duration of the revert animation, in milliseconds. Ignored if revert is false."

	self optionAt: 'revertDuration' put: anInteger
]

{ #category : #'options-generated' }
JQDraggable >> scope: aString [
	"Used to group sets of draggable and droppable items, in addition to droppable's accept option. A draggable with the same scope value as a droppable will be accepted by the droppable."

	self optionAt: 'scope' put: aString
]

{ #category : #'options-generated' }
JQDraggable >> scroll: aBoolean [
	"If set to true, container auto-scrolls while dragging."

	self optionAt: 'scroll' put: aBoolean
]

{ #category : #'options-generated' }
JQDraggable >> scrollSensitivity: anInteger [
	"Distance in pixels from the edge of the viewport after which the viewport should scroll. Distance is relative to pointer, not the draggable."

	self optionAt: 'scrollSensitivity' put: anInteger
]

{ #category : #'options-generated' }
JQDraggable >> scrollSpeed: anInteger [
	"The speed at which the window should scroll once the mouse pointer gets within the scrollSensitivity distance."

	self optionAt: 'scrollSpeed' put: anInteger
]

{ #category : #'options-generated' }
JQDraggable >> snap: aBooleanOrSelector [
	"If set to a selector or to true (equivalent to '.ui-draggable'), the draggable will snap to the edges of the selected elements when near an edge of the element."

	self optionAt: 'snap' put: aBooleanOrSelector
]

{ #category : #'options-generated' }
JQDraggable >> snapMode: aString [
	"Determines which edges of snap elements the draggable will snap to. Ignored if snap is false. Possible values: 'inner', 'outer', 'both'"

	self optionAt: 'snapMode' put: aString
]

{ #category : #'options-generated' }
JQDraggable >> snapTolerance: anInteger [
	"The distance in pixels from the snap element edges at which snapping should occur. Ignored if snap is false."

	self optionAt: 'snapTolerance' put: anInteger
]

{ #category : #'options-generated' }
JQDraggable >> stack: aSelector [
	"Controls the z-Index of the set of elements that match the selector, always brings to front the dragged item. Very useful in things like window managers."

	self optionAt: 'stack' put: aSelector
]
