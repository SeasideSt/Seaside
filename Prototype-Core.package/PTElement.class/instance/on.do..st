events
on: aString do: aHandlerObject 
	"Register the handler aBlock for the event aString on the receiving DOM element. Please refer to SUEvent>>#observe:on:do: for further information."
	
	self call: 'observe' with: aString with: (aHandlerObject asFunction: #('event'))