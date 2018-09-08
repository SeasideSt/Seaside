events-register
onInput: anObject
	"Register a handler to be called when the first Ajax request begins."
	
	self on: 'input' do: anObject asFunction