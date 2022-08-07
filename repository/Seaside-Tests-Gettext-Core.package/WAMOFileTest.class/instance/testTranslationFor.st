test
testTranslationFor	
	| anMOFile result |
	anMOFile := WAMOFile new initializeFromStream: self class moFileBinaryForLocaleNLBE readStream localeId: 'nl'.
	
	result := anMOFile translationFor: 'fontsize'.
	self assert: result isSuccessful.
	self assert: result translation equals: 'schriftgrootte'.
	
	result := anMOFile translationFor: 'nonexisting string'.
	self deny: result isSuccessful.
	self assert: result translation equals: 'nonexisting string'.