events-register
onPointerCancel: anObject
	"Bind an event handler to the 'pointercancel' JavaScript event."
	
	self on: 'pointercancel' do: anObject
