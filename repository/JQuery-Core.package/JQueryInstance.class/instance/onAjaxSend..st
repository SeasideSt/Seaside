ajax-events
onAjaxSend: anObject
	"Show a message before an Ajax request is sent."
	
	self on: 'ajaxSend' do: anObject
