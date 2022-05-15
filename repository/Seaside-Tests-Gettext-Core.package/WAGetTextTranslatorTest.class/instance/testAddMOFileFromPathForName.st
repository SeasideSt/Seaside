test
testAddMOFileFromPathForName

	| fs file translator currentWorkingDirectory |
	fs := FileSystem memory.
	file := self createMOFile: fs. "The WAMOFile should have nl-BE as locale"
	currentWorkingDirectory := (fs / 'nl_BE').
	
	translator := WAGetTextTranslator new.
	translator refresh.
	translator addMOFileFromPath: currentWorkingDirectory forName: (self appNameForTests).

	self assert: translator supportedLocaleStrings size equals: 1.
	self assert: translator supportedLocaleStrings equals: #('nl-BE').
	
	
	