events-register
onSelect: anObject
	"Bind an event handler to the 'select' JavaScript event."
	
	self on: 'select' do: anObject
