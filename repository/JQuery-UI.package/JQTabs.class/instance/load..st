actions
load: anInteger
	"Reload the content of an Ajax tab programmatically. This method always loads the tab content from the remote location, even if cache is set to true. The second argument is the zero-based index of the tab to be reloaded."
	
	self action: 'load' arguments: (Array with: anInteger)