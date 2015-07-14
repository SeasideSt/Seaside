class initialization
configureApplicationDefaults
	(configuredApplicationDefaults ifNil: [ false ]) ifFalse: [
		WAAdmin applicationDefaults
			at: #responseGenerator put: WAHtmlResponseGenerator.
		configuredApplicationDefaults := true ]