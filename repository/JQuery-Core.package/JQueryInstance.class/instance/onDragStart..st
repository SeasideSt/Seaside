events-register
onDragStart: anObject
	"Bind an event handler to the 'dragstart' JavaScript event."
	
	self on: 'dragstart' do: anObject
