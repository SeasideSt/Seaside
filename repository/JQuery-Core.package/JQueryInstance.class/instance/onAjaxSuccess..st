ajax-events
onAjaxSuccess: anObject
	"Show a message when an Ajax request completes successfully."
	
	self on: 'ajaxSuccess' do: anObject
