events-register
onPointerEnter: anObject
	"Bind an event handler to the 'pointerenter' JavaScript event."
	
	self on: 'pointerenter' do: anObject
