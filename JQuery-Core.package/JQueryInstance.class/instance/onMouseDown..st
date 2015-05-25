events-register
onMouseDown: anObject
	"Bind an event handler to the 'mousedown' JavaScript event, or trigger that event on an element."
	
	self call: 'mousedown' with: anObject asFunction