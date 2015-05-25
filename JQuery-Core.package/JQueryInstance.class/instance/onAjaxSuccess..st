ajax-events
onAjaxSuccess: anObject
	"Show a message when an Ajax request completes successfully."
	
	self call: 'ajaxSuccess' with: anObject asFunction