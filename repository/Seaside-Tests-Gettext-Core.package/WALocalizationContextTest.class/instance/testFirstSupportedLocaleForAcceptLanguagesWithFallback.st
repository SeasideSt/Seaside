test
testFirstSupportedLocaleForAcceptLanguagesWithFallback

	| aLocalizationContext acceptLanguages resultLocale |
		
	aLocalizationContext := WALocalizationContext new.
	aLocalizationContext instVarNamed: 'translator' put: (WAGetTextTranslator translatorFor: WAGettextExample getTextExampleApplicationName).
	acceptLanguages := WAAcceptLanguage fromString: 'nl-BE;q=1.0,fr;q=0.5'.
	
	resultLocale := aLocalizationContext firstSupportedLocaleForAcceptLanguages: acceptLanguages withFallback: [ ].
	self assert: resultLocale localeId equals: 'nl-BE'.
	
	acceptLanguages := WAAcceptLanguage fromString: 'ch-DE;q=1.0'.
	resultLocale := aLocalizationContext firstSupportedLocaleForAcceptLanguages: acceptLanguages withFallback: [ ].
	self assert: resultLocale isNil.
	
	resultLocale := aLocalizationContext firstSupportedLocaleForAcceptLanguages: acceptLanguages withFallback: [ WALocale language: 'en' ].
	self assert: resultLocale localeId equals: 'en'.