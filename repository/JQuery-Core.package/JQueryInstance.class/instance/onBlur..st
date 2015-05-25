events-register
onBlur: anObject
	"Bind an event handler to the 'blur' JavaScript event, or trigger that event on an element."
	
	self call: 'blur' with: anObject asFunction