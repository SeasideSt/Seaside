initialization
setUp
	super setUp.
	[ WAGetTextTranslator removeTranslatorFor: WAGettextExample getTextExampleApplicationName ] on: Error do:[ :e | ].
	WAGetTextTranslator createTranslatorFor: WAGettextExample getTextExampleApplicationName fromFilesIn: (GRPlatform current seasideGettextExampleFilesDirectory).