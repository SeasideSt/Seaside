actions
toggleHelp
	self showHelp: self showHelp not.
	self showHelp
		ifTrue: [ self collapsed: false ]