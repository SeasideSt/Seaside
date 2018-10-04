events-register
onUnload: anObject
	"Binds a function to the unload event of each matched element."
	
	self on: 'unload' do: anObject asFunction