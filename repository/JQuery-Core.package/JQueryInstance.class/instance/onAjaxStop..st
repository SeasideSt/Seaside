ajax-events
onAjaxStop: anObject
	"Hide a loading message after all the Ajax requests have stopped."
	
	self call: 'ajaxStop' with: anObject asFunction