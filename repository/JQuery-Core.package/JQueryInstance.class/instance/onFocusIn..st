events-register
onFocusIn: anObject
	"Bind an event handler to the 'focusin' JavaScript event."
	
	self on: 'focusin' do: anObject
