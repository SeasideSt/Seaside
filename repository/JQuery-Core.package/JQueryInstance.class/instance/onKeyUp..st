events-register
onKeyUp: anObject
	"Bind an event handler to the 'keyup' JavaScript event."
	
	self on: 'keyup' do: anObject
