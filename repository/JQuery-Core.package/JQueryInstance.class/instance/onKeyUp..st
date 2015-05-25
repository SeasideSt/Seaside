events-register
onKeyUp: anObject
	"Bind an event handler to the 'keyup' JavaScript event, or trigger that event on an element."
	
	self call: 'keyup' with: anObject asFunction