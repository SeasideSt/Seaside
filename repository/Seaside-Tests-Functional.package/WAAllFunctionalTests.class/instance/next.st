actions
next
	| nextIndex |
	nextIndex := self selectionIndex \\ classes size + 1.
	self selected: (classes at: nextIndex)
	