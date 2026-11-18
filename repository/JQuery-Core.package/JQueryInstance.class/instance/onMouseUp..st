events-register
onMouseUp: anObject
	"Bind an event handler to the 'mouseup' JavaScript event."
	
	self on: 'mouseup' do: anObject
