updating
updateStates: aSnapshot
	super updateStates: aSnapshot.
	(WAAllPresenterGuide client:
		(WAUpdateStatesVisitor snapshot: aSnapshot))
		start: self presenter