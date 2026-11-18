events-register
onDragOver: anObject
	"Bind an event handler to the 'dragover' JavaScript event."
	
	self on: 'dragover' do: anObject
