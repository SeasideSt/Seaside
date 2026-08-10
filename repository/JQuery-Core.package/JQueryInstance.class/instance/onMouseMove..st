events-register
onMouseMove: anObject
	"Bind an event handler to the 'mousemove' JavaScript event, or trigger that event on an element."
	
	self on: 'mousemove' do: anObject
