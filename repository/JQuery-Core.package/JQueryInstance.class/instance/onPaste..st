events-register
onPaste: anObject
	"Bind an event handler to the 'paste' JavaScript event."
	
	self on: 'paste' do: anObject
