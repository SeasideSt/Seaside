events-register
onError: anObject
	"Bind an event handler to the 'error' JavaScript event."
	
	self call: 'error' with: anObject asFunction