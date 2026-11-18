events-register
onPointerMove: anObject
	"Bind an event handler to the 'pointermove' JavaScript event."
	
	self on: 'pointermove' do: anObject
