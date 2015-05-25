initialization
initializeWith: anInteger
	self initialize.
	pathElementCount := anInteger.
	routes := SortedCollection sortBlock: [ :a :b |
		a priority > b priority ]