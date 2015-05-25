events-register
onKeyPress: anObject
	"Bind an event handler to the 'keypress' JavaScript event, or trigger that event on an element."
	
	self call: 'keypress' with: anObject asFunction