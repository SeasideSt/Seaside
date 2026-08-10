events-register
onMouseEnter: anObject
	"Bind an event handler to be fired when the mouse enters an element, or trigger that handler on an element."
	
	self on: 'mouseenter' do: anObject
