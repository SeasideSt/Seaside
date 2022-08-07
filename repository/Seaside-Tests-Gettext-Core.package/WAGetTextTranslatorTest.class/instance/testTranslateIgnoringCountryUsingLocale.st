test
testTranslateIgnoringCountryUsingLocale

	| translator |
	WAGetTextTranslator createTranslatorFor: WAGettextExample getTextExampleApplicationName fromFilesIn: (GRPlatform current seasideGettextExampleFilesDirectory).
	translator := WAGetTextTranslator translatorFor: WAGettextExample getTextExampleApplicationName.
	
	self assert: (translator translateIgnoringCountry: 'fontsize' usingLocale: (WALocale fromString: 'nl-BE')) equals: 'fontsize'.
	self assert: (translator translateIgnoringCountry: 'Select a locale below' usingLocale: (WALocale fromString: 'fr')) equals: 'Sélectionnez la locale ci-dessous'.
	self assert: (translator translateIgnoringCountry: 'Select a locale below' usingLocale: (WALocale fromString: 'fr-CH')) equals: 'Sélectionnez la locale ci-dessous'.
	
	WAGetTextTranslator removeTranslatorFor: WAGettextExample getTextExampleApplicationName