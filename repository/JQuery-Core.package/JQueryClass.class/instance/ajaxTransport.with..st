ajax
ajaxTransport: aString with: anObject
	"Register a transport factory for the given dataType expression."

	self call: 'ajaxTransport' with: aString with: anObject