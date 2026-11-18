events-register
onDoubleClick: anObject
	"Bind an event handler to the 'dblclick' JavaScript event."
	
	self on: 'dblclick' do: anObject
