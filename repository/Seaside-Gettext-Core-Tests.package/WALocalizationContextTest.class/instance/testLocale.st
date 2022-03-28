test
testLocale

	| aLocalizationContext aLocale result session request response context handler fs currentWorkingDirectory headers acceptLang |
	aLocale := WALocale language: 'fr'.
	fs := FileSystem memory.
	self createMOFile: fs.
	self createAnotherMOFile: fs.
	currentWorkingDirectory := (fs / '.') asFileReference.
	WAGetTextTranslator
		createTranslatorFor: self appNameForTests
		fromFiles: currentWorkingDirectory.

	session := WASession new.
	session locale: aLocale.
	handler := WAApplication new.
	handler configuration addParent: WAGetTextConfiguration instance.
	handler
		preferenceAt: #gettextApplicationName
		put: self appNameForTests.

	request := WARequest method: 'GET' uri: '/'.

	context := WARequestContext request: request response: response.
	aLocalizationContext := WALocalizationContext new.

	response := WABufferedResponse new.

	"Case: no accept headers and no session"
	WACurrentRequestContext use: context during: [ 
		WACurrentLocalizationContext use: aLocalizationContext during: [ 
			context push: handler during: [ 
				aLocalizationContext translator.
				result := aLocalizationContext locale.
				self assert: result greaseString equals: 'en' ] ] ].


	"Case: accept headers"
	headers := Dictionary new.
	acceptLang := 'nl-be;q=1.0,fr;q=0.5'.
	headers at: 'accept-language' put: acceptLang.
	request setHeaders: headers.
	WACurrentRequestContext use: context during: [ 
		WACurrentLocalizationContext use: aLocalizationContext during: [ 
			context push: handler during: [ 
				aLocalizationContext translator.
				result := aLocalizationContext locale.
				self assert: result greaseString equals: 'nl-be' ] ] ].

	"Case: session"
	WACurrentRequestContext use: context during: [ 
		WACurrentLocalizationContext use: aLocalizationContext during: [ 
			context push: handler during: [ 
				context push: session during: [ 
					aLocalizationContext translator.
					result := aLocalizationContext locale.
					self assert: result greaseString equals: 'fr' ] ] ] ]