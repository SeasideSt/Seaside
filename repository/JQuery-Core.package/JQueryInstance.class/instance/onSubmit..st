events-register
onSubmit: anObject
	"Bind an event handler to the 'submit' JavaScript event, or trigger that event on an element."
	
	self on: 'submit' do: anObject
