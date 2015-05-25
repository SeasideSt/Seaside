events-register
onKeyDown: anObject
	"Bind an event handler to the 'keydown' JavaScript event, or trigger that event on an element."
	
	self call: 'keydown' with: anObject asFunction