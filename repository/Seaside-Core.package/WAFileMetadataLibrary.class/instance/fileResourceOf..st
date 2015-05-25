private
fileResourceOf: aSelector
	^ (self respondsTo: aSelector)
		ifTrue: [ self perform: aSelector ]
		ifFalse: [ WAFileLibraryResource emptyInstance ]