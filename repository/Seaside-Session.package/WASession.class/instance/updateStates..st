updating
updateStates: aSnapshot
	self filters do: [ :each | each updateStates: aSnapshot ].
	aSnapshot register: filter