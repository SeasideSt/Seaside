"
Creates new selectable on the nodeset supplied by the query.
"
Class {
	#name : #JQSelectable,
	#superclass : #JQWidget,
	#category : 'JQuery-UI-Interaction'
}

{ #category : #'options-generated' }
JQSelectable >> autoRefresh: aBoolean [
	"This determines whether to refresh (recalculate) the position and size of each selectee at the beginning of each select operation. If you have many many items, you may want to set this to false and call the refresh method manually."

	self optionAt: 'autoRefresh' put: aBoolean
]

{ #category : #'options-generated' }
JQSelectable >> cancel: aSelector [
	"Prevents selecting if you start on elements matching the selector."

	self optionAt: 'cancel' put: aSelector
]

{ #category : #'options-generated' }
JQSelectable >> delay: anInteger [
	"Time in milliseconds to define when the selecting should start. It helps preventing unwanted selections when clicking on an element."

	self optionAt: 'delay' put: anInteger
]

{ #category : #'options-generated' }
JQSelectable >> distance: anInteger [
	"Tolerance, in pixels, for when selecting should start. If specified, selecting will not start until after mouse is dragged beyond distance."

	self optionAt: 'distance' put: anInteger
]

{ #category : #'options-generated' }
JQSelectable >> filter: aSelector [
	"The matching child elements will be made selectees (able to be selected)."

	self optionAt: 'filter' put: aSelector
]

{ #category : #accessing }
JQSelectable >> method [
	^ 'selectable'
]

{ #category : #'events-generated' }
JQSelectable >> onSelected: anObject [
	"This event is triggered at the end of the select operation, on each element added to the selection."

	self optionAt: 'selected' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSelectable >> onSelecting: anObject [
	"This event is triggered during the select operation, on each element added to the selection."

	self optionAt: 'selecting' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSelectable >> onStart: anObject [
	"This event is triggered at the beginning of the select operation."

	self optionAt: 'start' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSelectable >> onStop: anObject [
	"This event is triggered at the end of the select operation."

	self optionAt: 'stop' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSelectable >> onUnselected: anObject [
	"This event is triggered at the end of the select operation, on each element removed from the selection."

	self optionAt: 'unselected' put: anObject asFunction
]

{ #category : #'events-generated' }
JQSelectable >> onUnselecting: anObject [
	"This event is triggered during the select operation, on each element removed from the selection."

	self optionAt: 'unselecting' put: anObject asFunction
]

{ #category : #actions }
JQSelectable >> refresh [
	"Refresh the position and size of each selectee element."
	
	self action: 'refresh'
]

{ #category : #'options-generated' }
JQSelectable >> tolerance: aString [
	"Possible values: 'touch', 'fit'.  
''fit'': draggable overlaps the droppable entirely 
''touch'': draggable overlaps the droppable any amount "

	self optionAt: 'tolerance' put: aString
]
