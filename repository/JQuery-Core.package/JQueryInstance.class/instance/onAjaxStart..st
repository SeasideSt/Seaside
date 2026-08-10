ajax-events
onAjaxStart: anObject
	"Register a handler to be called when the first Ajax request begins."
	
	self on: 'ajaxStart' do: anObject
