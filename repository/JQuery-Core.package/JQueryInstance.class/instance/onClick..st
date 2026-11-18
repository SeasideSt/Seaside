events-register
onClick: anObject
	"Bind an event handler to the 'click' JavaScript event."
	
	self on: 'click' do: anObject
