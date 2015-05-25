events-register
onClick: anObject
	"Bind an event handler to the 'click' JavaScript event, or trigger that event on an element."
	
	self call: 'click' with: anObject asFunction