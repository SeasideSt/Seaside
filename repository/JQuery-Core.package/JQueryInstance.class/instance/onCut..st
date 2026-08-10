events-register
onCut: anObject
	"Bind an event handler to the 'cut' JavaScript event."
	
	self on: 'cut' do: anObject
