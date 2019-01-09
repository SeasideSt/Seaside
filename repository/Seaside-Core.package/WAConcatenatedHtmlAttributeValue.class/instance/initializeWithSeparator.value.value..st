initialization
initializeWithSeparator: aSeparator value: anFirstObject value: aSecondObject
	self initialize.
	separator := aSeparator.
	values := OrderedCollection new: 4.
	values add: anFirstObject.
	values add: aSecondObject