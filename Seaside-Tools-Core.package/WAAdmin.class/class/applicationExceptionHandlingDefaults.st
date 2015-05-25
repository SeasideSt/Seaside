configuration
applicationExceptionHandlingDefaults
	| config |
	config := WASharedConfiguration named: 'Application Exception Handling Defaults'.
	(configuredExceptionHandlingDefaults ifNil: [ false ]) ifFalse: [
		self configureApplicationExceptionHandlingDefaults: config.
		configuredExceptionHandlingDefaults := true ].
	^ config