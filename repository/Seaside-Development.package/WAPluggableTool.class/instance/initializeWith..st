initialization
initializeWith: aComponent
	self initialize.
	component := aComponent.
	component onAnswer: [ self answer ]