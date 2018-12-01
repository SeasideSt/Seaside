Class {
	#name : #JQEvent,
	#superclass : #JSObject,
	#instVars : [
		'owner'
	],
	#category : 'JQuery-Core-Objects'
}

{ #category : #accessing }
JQEvent >> currentTarget [
	"The current DOM element within the event bubbling phase. This attribute will always be equal to the this of the function."
	
	self access: 'currentTarget'
]

{ #category : #accessing }
JQEvent >> data [
	"Contains the optional data passed to jQuery.fn.bind when the current executing handler was bound."
	
	self access: 'data'
]

{ #category : #initialization }
JQEvent >> initialize [
	super initialize.
	self setOwner: (JSStream argumentAt: 1)
]

{ #category : #testing }
JQEvent >> isDefaultPrevented [
	"Returns whether event.preventDefault() was ever called on this event object."
	
	self call: 'isDefaultPrevented'
]

{ #category : #testing }
JQEvent >> isImmediatePropagationStopped [
	"Returns whether event.stopImmediatePropagation() was ever called on this event object."
	
	self call: 'isImmediatePropagationStopped'
]

{ #category : #testing }
JQEvent >> isPropagationStopped [
	"Returns whether event.stopPropagation() was ever called on this event object."
	
	self call: 'isPropagationStopped'
]

{ #category : #printing }
JQEvent >> javascriptContentOn: aStream [
	aStream javascript: owner
]

{ #category : #accessing }
JQEvent >> namespace [
	"This attribute contains the namespace specified when the event was triggered."
	
	self access: 'namespace'
]

{ #category : #accessing }
JQEvent >> pageX [
	"The pageX returns the mouse coordinates relative to the document."
	
	self access: 'pageX'
]

{ #category : #accessing }
JQEvent >> pageY [
	"The pageY returns the mouse coordinates relative to the document."
	
	self access: 'pageY'
]

{ #category : #actions }
JQEvent >> preventDefault [
	"Prevents the browser from executing the default action. Use the method isDefaultPrevented to know whether this method was ever called (on that event object)."
	
	self call: 'preventDefault'
]

{ #category : #accessing }
JQEvent >> relatedTarget [
	"On mouse movement, contains the DOM element which the mouse was previously on when moving onto or off of an element."
	
	self access: 'relatedTarget'
]

{ #category : #accessing }
JQEvent >> result [
	"Will contain the last value returned by an event handler (that wasn't undefined)."
	
	self access: 'result'
]

{ #category : #initialization }
JQEvent >> setOwner: anObject [
	owner := anObject
]

{ #category : #actions }
JQEvent >> stopImmediatePropagation [
	"Keeps the rest of the handlers from being executed. This method also stops the bubbling by calling event.stopPropagation()."
	
	self call: 'stopImmediatePropagation'
]

{ #category : #actions }
JQEvent >> stopPropagation [
	"Stops the bubbling of an event to parent elements, preventing any parent handlers from being notified of the event."
	
	self call: 'stopPropagation'
]

{ #category : #accessing }
JQEvent >> target [
	"Contains the DOM element that issued the event."
	
	self access: 'target'
]

{ #category : #accessing }
JQEvent >> timeStamp [
	"The timestamp (in milliseconds) when the event was created."
	
	self access: 'timeStamp'
]

{ #category : #accessing }
JQEvent >> type [
	"Describes the nature of the event."
	
	self access: 'type'
]
