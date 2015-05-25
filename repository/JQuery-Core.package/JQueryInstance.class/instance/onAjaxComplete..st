ajax-events
onAjaxComplete: anObject
	"Register a handler to be called when Ajax requests complete."
	
	self call: 'ajaxComplete' with: anObject asFunction