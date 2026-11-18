events-register
onDragEnd: anObject
	"Bind an event handler to the 'dragend' JavaScript event."
	
	self on: 'dragend' do: anObject
