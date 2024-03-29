test
testCreateAndRemoveTextTranslator

	| translator |
	"First ensure there is no registered translator"
	[ WAGetTextTranslator removeTranslatorFor: WAGettextExample getTextExampleApplicationName ] on: Error do:[:e | ].

	self assert: (WAGetTextTranslator translatorFor: WAGettextExample getTextExampleApplicationName) isNil.
	WAGettextExample addTranslatorForExample.
	translator := WAGetTextTranslator translatorFor: WAGettextExample getTextExampleApplicationName.
	self assert: translator supportedLocaleIds asSet equals: { 'nl-BE' . 'fr' . 'de-CH' } asSet.
	WAGetTextTranslator removeTranslatorFor: WAGettextExample getTextExampleApplicationName.
	self assert: (WAGetTextTranslator translatorFor: WAGettextExample getTextExampleApplicationName) isNil