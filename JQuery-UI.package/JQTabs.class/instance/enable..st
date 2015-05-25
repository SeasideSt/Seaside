actions
enable: anInteger
	"Enable a disabled tab.  To enable more than one tab at once reset the disabled property like: <code>$('#example').data('disabled.tabs', []);</code>. The second argument is the zero-based index of the tab to be enabled."
	
	self action: 'enable' arguments: (Array with: anInteger)