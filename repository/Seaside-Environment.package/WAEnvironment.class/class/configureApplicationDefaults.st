class initialization
configureApplicationDefaults
	(configuredApplicationDefaults ifNil: [ false ]) ifFalse: [
		WAAdmin applicationDefaults
			at: #responseGenerator putClass: WAHtmlResponseGenerator.
		configuredApplicationDefaults := true ]