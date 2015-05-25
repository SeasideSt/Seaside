updating
updateStates: aSnapshot
	super updateStates: aSnapshot.
	updateStatesBlock isNil
		ifFalse: [ updateStatesBlock value: aSnapshot ]