events-register
onContextMenu: anObject
	"Bind an event handler to the 'contextmenu' JavaScript event."
	
	self on: 'contextmenu' do: anObject
