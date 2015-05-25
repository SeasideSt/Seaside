events-register
onFocus: anObject
	"Bind an event handler to the 'focus' JavaScript event, or trigger that event on an element."
	
	self call: 'focus' with: anObject asFunction