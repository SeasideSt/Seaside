state variables
sortColumn: anObject
	isReversed := anObject = self sortColumn and: [ isReversed not ].
	sortColumn contents: anObject