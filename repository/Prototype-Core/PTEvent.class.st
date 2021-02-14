"
Event management is one of the really sore spots of cross-browser scripting.
True, the prominent issue is: everybody does it the W3C way, and MSIE does it another way altogether. But there are quite a few subtler, sneakier issues here and there waiting to bite your ankle, such as the keypress/keydown issue with KHTML-based browsers (Konqueror and Safari). Also, MSIE has a tendency to leak memory when it comes to discarding event handlers.
"
Class {
	#name : #PTEvent,
	#superclass : #PTPrototype,
	#instVars : [
		'event'
	],
	#category : 'Prototype-Core-Elements'
}

{ #category : #private }
PTEvent >> defaultArguments [
	^ nil
]

{ #category : #private }
PTEvent >> defaultEvent [
	^ JSStream on: 'event'
]

{ #category : #private }
PTEvent >> defaultPrototype [
	^ 'Event'
]

{ #category : #querying }
PTEvent >> element [
	"Returns the DOM element on which the event occurred."
	self 
		call: 'element'
		with: self event
]

{ #category : #accessing }
PTEvent >> event [
	^ event ifNil: [ self defaultEvent ]
]

{ #category : #accessing }
PTEvent >> event: anObject [
	event := anObject
]

{ #category : #querying }
PTEvent >> findElement: aString [ 
	"Returns the first DOM element with a given tag name, upwards from the one on which the event occurred."
	self 
		call: 'findElement'
		with: self event
		with: aString
]

{ #category : #querying }
PTEvent >> isLeftClick [
	"Determines whether a button-related mouse event was about the left (primary, actually) button."
	self 
		call: 'isLeftClick'
		with: self event
]

{ #category : #actions }
PTEvent >> observe: anObservedObject on: anEventString do: aHandlerObject [ 
	"Define event handler aHandlerObject for anEventString."
	self 
		call: 'observe'
		withArguments: (Array 
				with: anObservedObject
				with: anEventString
				with: (aHandlerObject asFunction: #('event' )))
]

{ #category : #actions }
PTEvent >> stop [
	"Stops the event's propagation and prevents its default action from being triggered eventually."

	self call: 'stop' with: self event
]

{ #category : #querying }
PTEvent >> x [
	"Returns the absolute horizontal position for a mouse event."

	self call: 'pointerX' with: self event
]

{ #category : #querying }
PTEvent >> y [
	"Returns the absolute vertical position for a mouse event."

	self call: 'pointerY' with: self event
]
