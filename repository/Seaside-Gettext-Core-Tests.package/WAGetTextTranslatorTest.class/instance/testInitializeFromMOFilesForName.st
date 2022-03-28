test
testInitializeFromMOFilesForName

	| fs file translator currentWorkingDirectory |
	fs := FileSystem memory.
	file := self createMOFile: fs. "The WAMOFile should have nl-BE as locale"
	currentWorkingDirectory := (fs / '.') asFileReference.
	
	translator := WAGetTextTranslator basicNew initializeFromMOFiles: currentWorkingDirectory forName: (self appNameForTests).
	self deny: translator equals: nil.
	self assert: translator supportedLocaleStrings size equals: 1.
	self assert: translator supportedLocaleStrings equals: #('nl-BE').