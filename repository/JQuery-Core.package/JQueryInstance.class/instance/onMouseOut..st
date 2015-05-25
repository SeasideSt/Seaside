events-register
onMouseOut: anObject
	"Bind an event handler to the 'mouseout' JavaScript event, or trigger that event on an element."
	
	self call: 'mouseout' with: anObject asFunction