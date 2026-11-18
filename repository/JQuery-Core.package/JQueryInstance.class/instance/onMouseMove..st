events-register
onMouseMove: anObject
	"Bind an event handler to the 'mousemove' JavaScript event."
	
	self on: 'mousemove' do: anObject
