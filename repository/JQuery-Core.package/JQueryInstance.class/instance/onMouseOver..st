events-register
onMouseOver: anObject
	"Bind an event handler to the 'mouseover' JavaScript event, or trigger that event on an element."
	
	self on: 'mouseover' do: anObject
