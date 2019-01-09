events-register
onInput: anObject
	"Bind an event handler to the 'input' JavaScript event, or trigger that event on an element."
	
	self on: 'input' do: anObject asFunction