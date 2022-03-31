test
testTranslateUsingLocale

	| fs file translator currentWorkingDirectory result |
	fs := FileSystem memory.
	file := self createMOFile: fs. "The WAMOFile should have nl-BE as locale"
	currentWorkingDirectory := (fs / '.') asFileReference.
	
	WAGetTextTranslator createTranslatorFor: (self appNameForTests) fromFiles: currentWorkingDirectory.
	translator := WAGetTextTranslator translatorFor: (self appNameForTests).
	result := translator translate: 'fontsize' usingLocale: (WALocale fromString: 'nl-BE').
	self assert: result equals: 'schriftgrootte'.
	self assert: translator supportedLocaleStrings size equals: 1.
	self assert: translator supportedLocaleStrings equals: #('nl-BE').
