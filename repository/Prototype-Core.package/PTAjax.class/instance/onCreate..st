events
onCreate: anObject
	"Triggered when the Ajax.Request object is initialized. This is after the parameters and the URL have been processed, but before first using the methods of the XHR object."

	self optionAt: 'onCreate' put: anObject asFunction