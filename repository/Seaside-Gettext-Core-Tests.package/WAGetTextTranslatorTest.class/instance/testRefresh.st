test
testRefresh
	| fs file currentWorkingDirectory translator |
	fs := FileSystem memory.
	file := self createMOFile: fs.
	currentWorkingDirectory := (fs / '.') asFileReference.
	
	WAGetTextTranslator createTranslatorFor: (self appNameForTests) fromFiles: currentWorkingDirectory.
	translator := WAGetTextTranslator translatorFor: (self appNameForTests).
	
	self deny: translator moFiles size equals: 0.
	translator refresh.
	self assert: translator moFiles size equals: 0.