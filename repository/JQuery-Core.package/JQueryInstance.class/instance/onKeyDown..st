events-register
onKeyDown: anObject
	"Bind an event handler to the 'keydown' JavaScript event."
	
	self on: 'keydown' do: anObject
