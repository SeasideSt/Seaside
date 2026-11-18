events-register
onPointerDown: anObject
	"Bind an event handler to the 'pointerdown' JavaScript event."
	
	self on: 'pointerdown' do: anObject
