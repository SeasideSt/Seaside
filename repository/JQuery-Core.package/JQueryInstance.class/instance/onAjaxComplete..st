ajax-events
onAjaxComplete: anObject
	"Register a handler to be called when Ajax requests complete."
	
	self on: 'ajaxComplete' do: anObject
