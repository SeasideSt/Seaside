events-register
onDrop: anObject
	"Bind an event handler to the 'drop' JavaScript event."
	
	self on: 'drop' do: anObject
