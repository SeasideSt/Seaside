events-register
onResize: anObject
	"Bind an event handler to the 'resize' JavaScript event."
	
	self on: 'resize' do: anObject
