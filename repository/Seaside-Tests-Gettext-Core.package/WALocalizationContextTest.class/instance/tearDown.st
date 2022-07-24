initialization
tearDown
	[ WAGetTextTranslator removeTranslatorFor: WAGettextExample getTextExampleApplicationName ] on: Error do:[ :e | ].
	super tearDown.