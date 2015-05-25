actions
toggleVisbility
	self collapsed: self collapsed not.
	self collapsed
		ifTrue: [ self showHelp: false ]