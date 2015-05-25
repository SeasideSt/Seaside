accessing
helpTexts
	HelpTexts ifNil: [ self initHelpTexts ].
	^ HelpTexts