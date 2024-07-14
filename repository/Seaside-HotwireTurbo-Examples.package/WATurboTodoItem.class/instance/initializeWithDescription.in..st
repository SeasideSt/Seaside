initialization
initializeWithDescription: aString in: aCollection
	self initialize.
	self done: false.
	self description: aString.
	editmode := false.
	todos := aCollection