events-register
onLoad: anObject
	"Bind an event handler to the 'load' JavaScript event."
	
	self on: 'load' do: anObject asFunction