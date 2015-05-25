events-register
onMouseLeave: anObject
	"Bind an event handler to be fired when the mouse leaves an element, or trigger that handler on an element."
	
	self call: 'mouseleave' with: anObject asFunction