events-register
onChange: anObject
	"Bind an event handler to the 'change' JavaScript event, or trigger that event on an element."
	
	self call: 'change' with: anObject asFunction