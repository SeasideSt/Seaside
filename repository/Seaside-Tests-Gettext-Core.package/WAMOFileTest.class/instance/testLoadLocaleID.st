test
testLoadLocaleID
	
	| anMOFile |		
	anMOFile := WAMOFile new initializeFromStream: self class moFileBinaryForLocaleNLBE readStream localeId: 'nl'.
	
	self assert: anMOFile translatedStrings size equals: 4.
	self assert: anMOFile translatedStrings allButFirst equals: #('Kies een locale hieronder' 'schriftgrootte' 'locale').
	self assert: anMOFile translations size equals: 4.
	self assert: anMOFile translations equals: ((Dictionary new) add: ('Select a locale below'->2); add: ('fontsize'->3); add: (''->1); add: ('locale'->4); yourself).