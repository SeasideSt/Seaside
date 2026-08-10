ajax-events
onAjaxStop: anObject
	"Hide a loading message after all the Ajax requests have stopped."
	
	self on: 'ajaxStop' do: anObject
