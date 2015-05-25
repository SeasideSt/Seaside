events-register
onFocusOut: anObject
	"Bind an event handler to the 'focusout' JavaScript event."
	
	self call: 'focusout' with: anObject asFunction