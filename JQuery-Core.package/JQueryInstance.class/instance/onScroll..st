events-register
onScroll: anObject
	"Bind an event handler to the 'scroll' JavaScript event, or trigger that event on an element."
	
	self call: 'scroll' with: anObject asFunction