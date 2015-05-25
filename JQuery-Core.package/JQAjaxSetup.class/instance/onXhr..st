events
onXhr: anObject
	"Callback for creating the XMLHttpRequest object. Defaults to the ActiveXObject when available (IE), the XMLHttpRequest otherwise. Override to provide your own implementation for XMLHttpRequest or enhancements to the factory."
	
	self optionAt: 'xhr' put: anObject asFunction