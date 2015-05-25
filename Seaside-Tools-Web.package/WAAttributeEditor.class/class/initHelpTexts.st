accessing
initHelpTexts
	HelpTexts := Dictionary new.
	HelpTexts at: #inheritedConfiguration put: 'Modify references to other configurations.
	- You can add user or global configs
	- Only shared configs (marked with *) can be configured'.
	^ HelpTexts