tests
testLanguageName
	| locale |
	locale := WALocale fromString: 'de'.
	
	self assert: locale languageName = 'German'.
	
	locale := WALocale fromString: 'gsw'.
	
	self assert: locale languageName = 'Swiss German; Alemannic; Alsatian'