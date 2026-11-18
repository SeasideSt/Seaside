events-register
onMouseOver: anObject
	"Bind an event handler to the 'mouseover' JavaScript event."
	
	self on: 'mouseover' do: anObject
