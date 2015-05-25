initialization
initializeOn: aHandler
	self initialize.
	handler := aHandler.
	filterEditor := WAFilterAttributeEditor new handler: handler; group: #filters; parent: self; yourself.
	aHandler configuration isNil ifFalse: [
		configurationEditor := aHandler configuration configurationComponent.
		configurationEditor parent: self.
		configurationEditor onAnswer: [ self answer ] ]