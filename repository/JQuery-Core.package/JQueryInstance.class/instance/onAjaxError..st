ajax-events
onAjaxError: anObject
	"Register a handler to be called when Ajax requests complete with an error."
	
	self call: 'ajaxError' with: anObject asFunction