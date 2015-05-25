events-register
onResize: anObject
	"Bind an event handler to the 'resize' JavaScript event, or trigger that event on an element."
	
	self call: 'resize' with: anObject asFunction