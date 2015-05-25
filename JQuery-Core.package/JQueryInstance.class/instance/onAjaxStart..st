ajax-events
onAjaxStart: anObject
	"Register a handler to be called when the first Ajax request begins."
	
	self call: 'ajaxStart' with: anObject asFunction