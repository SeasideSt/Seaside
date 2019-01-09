events-register
onError: anObject
	"Bind an event handler to the 'error' JavaScript event."
	
	self on: 'error' do: anObject asFunction