events-register
onFocus: anObject
	"Bind an event handler to the 'focus' JavaScript event."
	
	self on: 'focus' do: anObject
