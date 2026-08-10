events-register
onCompositionEnd: anObject
	"Bind an event handler to the 'compositionend' JavaScript event."
	
	self on: 'compositionend' do: anObject
