events-register
onCompositionUpdate: anObject
	"Bind an event handler to the 'compositionupdate' JavaScript event."
	
	self on: 'compositionupdate' do: anObject
