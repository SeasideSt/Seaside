initialization
initializeOn: aComponent body: anObject
	self initialize.
	owner := aComponent.
	body := anObject