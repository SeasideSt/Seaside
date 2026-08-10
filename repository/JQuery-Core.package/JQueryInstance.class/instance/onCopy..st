events-register
onCopy: anObject
	"Bind an event handler to the 'copy' JavaScript event."
	
	self on: 'copy' do: anObject
