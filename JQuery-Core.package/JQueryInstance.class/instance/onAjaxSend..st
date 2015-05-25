ajax-events
onAjaxSend: anObject
	"Show a message before an Ajax request is sent."
	
	self call: 'ajaxSend' with: anObject asFunction