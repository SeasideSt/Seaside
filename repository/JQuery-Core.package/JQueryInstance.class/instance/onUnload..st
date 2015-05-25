events-register
onUnload: anObject
	"Binds a function to the unload event of each matched element."
	
	self call: 'unload' with: anObject asFunction