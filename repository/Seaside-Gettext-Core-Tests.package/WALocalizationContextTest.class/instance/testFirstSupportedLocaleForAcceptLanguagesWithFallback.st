test
testFirstSupportedLocaleForAcceptLanguagesWithFallback

	| aLocalizationContext acceptLanguages aLocale fs currentWorkingDirectory handler resultLocale |
	fs := FileSystem memory.
	self createMOFile: fs.
	self createAnotherMOFile: fs.
	currentWorkingDirectory := (fs / '.') asFileReference.
	WAGetTextTranslator
		createTranslatorFor: self appNameForTests
		fromFiles: currentWorkingDirectory.
		
	aLocalizationContext := WALocalizationContext new.
	acceptLanguages := WAAcceptLanguage fromString: 'nl-be;q=1.0,fr;q=0.5'.
	
	aLocalizationContext translatorForTestingWithApplicationName: self appNameForTests.
	resultLocale := aLocalizationContext firstSupportedLocaleForAcceptLanguages: acceptLanguages withFallback: [ ].
	self assert: resultLocale greaseString equals: 'nl-be'.
	
	acceptLanguages := WAAcceptLanguage fromString: 'ch-de;q=1.0'.
	resultLocale := aLocalizationContext firstSupportedLocaleForAcceptLanguages: acceptLanguages withFallback: [ ].
	self assert: resultLocale greaseString equals: 'nil'. "Should be nil because there is no fallback"
	
	resultLocale := aLocalizationContext firstSupportedLocaleForAcceptLanguages: acceptLanguages withFallback: [ WALocale language: 'en' ].
	self assert: resultLocale greaseString equals: 'en'.