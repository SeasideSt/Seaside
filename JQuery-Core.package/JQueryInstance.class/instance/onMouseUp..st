events-register
onMouseUp: anObject
	"Bind an event handler to the 'mouseup' JavaScript event, or trigger that event on an element."
	
	self call: 'mouseup' with: anObject asFunction