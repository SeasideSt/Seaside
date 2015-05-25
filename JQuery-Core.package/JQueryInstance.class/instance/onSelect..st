events-register
onSelect: anObject
	"Bind an event handler to the 'select' JavaScript event, or trigger that event on an element."
	
	self call: 'select' with: anObject asFunction