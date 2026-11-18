events-register
onMouseDown: anObject
	"Bind an event handler to the 'mousedown' JavaScript event."
	
	self on: 'mousedown' do: anObject
