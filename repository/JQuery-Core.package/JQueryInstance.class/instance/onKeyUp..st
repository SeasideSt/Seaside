events-register
onKeyUp: anObject
	"Bind an event handler to the 'keyup' JavaScript event, or trigger that event on an element."
	
	self on: 'keyup' do: anObject
