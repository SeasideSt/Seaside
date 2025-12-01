"
A WAGetTextTranslatorTest is a test class for testing the behavior of WAGetTextTranslator
"
Class {
	#name : 'WAGetTextTranslatorTest',
	#superclass : 'TestCase',
	#category : 'Seaside-Tests-Gettext-Core',
	#package : 'Seaside-Tests-Gettext-Core'
}

{ #category : 'test' }
WAGetTextTranslatorTest >> testCreateAndRemoveTextTranslator [

	| translator |
	"First ensure there is no registered translator"
	[ WAGetTextTranslator removeTranslatorFor: WAGettextExample getTextExampleApplicationName ] on: Error do:[:e | ].

	self assert: (WAGetTextTranslator translatorFor: WAGettextExample getTextExampleApplicationName) isNil.
	WAGettextExample addTranslatorForExample.
	translator := WAGetTextTranslator translatorFor: WAGettextExample getTextExampleApplicationName.
	self assert: translator supportedLocaleIds asSet equals: { 'nl-BE' . 'fr' . 'de-CH' } asSet.
	WAGetTextTranslator removeTranslatorFor: WAGettextExample getTextExampleApplicationName.
	self assert: (WAGetTextTranslator translatorFor: WAGettextExample getTextExampleApplicationName) isNil
]

{ #category : 'test' }
WAGetTextTranslatorTest >> testTranslateIgnoringCountryUsingLocale [

	| translator |
	WAGettextExample addTranslatorForExample.
	translator := WAGetTextTranslator translatorFor: WAGettextExample getTextExampleApplicationName.
	
	self assert: (translator translateIgnoringCountry: 'fontsize' usingLocale: (WALocale fromString: 'nl-BE')) equals: 'fontsize'.
	self assert: (translator translateIgnoringCountry: 'Select a locale below' usingLocale: (WALocale fromString: 'fr')) equals: 'Sélectionnez la locale ci-dessous'.
	self assert: (translator translateIgnoringCountry: 'Select a locale below' usingLocale: (WALocale fromString: 'fr-CH')) equals: 'Sélectionnez la locale ci-dessous'.
	
	WAGetTextTranslator removeTranslatorFor: WAGettextExample getTextExampleApplicationName
]

{ #category : 'test' }
WAGetTextTranslatorTest >> testTranslateUsingLocale [

	| translator |
	WAGettextExample addTranslatorForExample.
	translator := WAGetTextTranslator translatorFor: WAGettextExample getTextExampleApplicationName.
	
	self assert: (translator translate: 'fontsize' usingLocale: (WALocale fromString: 'nl-BE')) equals: 'schriftgrootte'.
	self assert: (translator translate: 'Select a locale below' usingLocale: (WALocale fromString: 'fr')) equals: 'Sélectionnez la locale ci-dessous'.
	self assert: (translator translate: 'Select a locale below' usingLocale: (WALocale fromString: 'de-CH')) equals: 'Wählen Sie unten ein Gebietsschema aus'.
	
	WAGetTextTranslator removeTranslatorFor: WAGettextExample getTextExampleApplicationName
]
