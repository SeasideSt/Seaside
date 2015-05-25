configuration
applicationDefaults
	| config |
	config := WASharedConfiguration named: 'Application Defaults'.
	(configuredApplicationDefaults ifNil: [ false ]) ifFalse: [
		self configureApplicationDefaults: config.
		configuredApplicationDefaults := true ].
	^ config