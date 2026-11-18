events-register
onWheel: anObject
	"Bind an event handler to the 'wheel' JavaScript event."
	
	self on: 'wheel' do: anObject
