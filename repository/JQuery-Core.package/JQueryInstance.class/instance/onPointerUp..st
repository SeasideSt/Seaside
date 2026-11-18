events-register
onPointerUp: anObject
	"Bind an event handler to the 'pointerup' JavaScript event."
	
	self on: 'pointerup' do: anObject
