test
testTranslateUsingLocale

	| translator |
	WAGettextExample addTranslatorForExample.
	translator := WAGetTextTranslator translatorFor: WAGettextExample getTextExampleApplicationName.
	
	self assert: (translator translate: 'fontsize' usingLocale: (WALocale fromString: 'nl-BE')) equals: 'schriftgrootte'.
	self assert: (translator translate: 'Select a locale below' usingLocale: (WALocale fromString: 'fr')) equals: 'Sélectionnez la locale ci-dessous'.
	self assert: (translator translate: 'Select a locale below' usingLocale: (WALocale fromString: 'de-CH')) equals: 'Wählen Sie unten ein Gebietsschema aus'.
	
	WAGetTextTranslator removeTranslatorFor: WAGettextExample getTextExampleApplicationName