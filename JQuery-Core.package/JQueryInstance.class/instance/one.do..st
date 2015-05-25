events
one: aString do: anObject 
	"Attach a handler to an event for the elements. The handler is executed at most once."
	
	self call: 'one' with: aString with: anObject asFunction