events-register
onSubmit: anObject
	"Bind an event handler to the 'submit' JavaScript event."
	
	self on: 'submit' do: anObject
