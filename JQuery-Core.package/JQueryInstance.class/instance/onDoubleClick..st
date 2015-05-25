events-register
onDoubleClick: anObject
	"Bind an event handler to the 'dblclick' JavaScript event, or trigger that event on an element."
	
	self call: 'dblclick' with: anObject asFunction