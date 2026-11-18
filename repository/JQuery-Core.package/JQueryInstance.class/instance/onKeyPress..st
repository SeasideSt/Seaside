events-register
onKeyPress: anObject
	"Bind an event handler to the 'keypress' JavaScript event."
	
	self on: 'keypress' do: anObject
