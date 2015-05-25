actions
previous
	| nextIndex |
	nextIndex := (self selectionIndex + classes size - 2 \\ classes size) + 1.
	self selected: (classes at: nextIndex)