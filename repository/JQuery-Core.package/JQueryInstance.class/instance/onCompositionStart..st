events-register
onCompositionStart: anObject
	"Bind an event handler to the 'compositionstart' JavaScript event."
	
	self on: 'compositionstart' do: anObject
