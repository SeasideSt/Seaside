events-register
onLoad: anObject
	"Bind an event handler to the 'load' JavaScript event."
	
	self call: 'load' with: anObject asFunction