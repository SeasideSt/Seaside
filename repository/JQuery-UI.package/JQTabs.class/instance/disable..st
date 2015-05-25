actions
disable: anInteger
	"=Disable a tab. The selected tab cannot be disabled. To disable more than one tab at once use: <code>$('#example').data('disabled.tabs', [1, 2, 3]);</code>  The second argument is the zero-based index of the tab to be disabled. "
	
	self action: 'disable' arguments: (Array with: anInteger)