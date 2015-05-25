accessing
selector: aSymbol
	selector := aSymbol.
	self component: (class perform: selector)