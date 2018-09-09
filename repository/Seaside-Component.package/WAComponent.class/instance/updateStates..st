updating
updateStates: aSnapshot
	super updateStates: aSnapshot.
	decoration isNil
		ifFalse: [ aSnapshot register: decoration ]