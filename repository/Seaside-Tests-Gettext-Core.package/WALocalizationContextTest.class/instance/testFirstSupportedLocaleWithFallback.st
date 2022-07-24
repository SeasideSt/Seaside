test
testFirstSupportedLocaleWithFallback
	| headers acceptLang request requestContext aLocalizationContext handler |
	
	handler := WAApplication new.
	handler configuration addParent: WAGetTextConfiguration instance.
	handler
		preferenceAt: #gettextApplicationName
		put: WAGettextExample getTextExampleApplicationName.

	request := WARequest method: 'GET' uri: '/'.
	requestContext := WARequestContext request: request response: nil.
	aLocalizationContext := WALocalizationContext new.
		
	"Case: accept headers"
	headers := Dictionary new.
	acceptLang := 'nl-BE;q=1.0,fr;q=0.5'.
	headers at: 'accept-language' put: acceptLang.
	request setHeaders: headers.
	WACurrentRequestContext use: requestContext during: [ 
		WACurrentLocalizationContext use: aLocalizationContext during: [ 
			requestContext push: handler during: [ 
				self assert: (aLocalizationContext firstSupportedLocaleWithFallback: [  ]) localeId equals: 'nl-BE' ] ] ].
	
	"Case: session"
	request := WARequest method: 'GET' uri: '/'.
	requestContext := WARequestContext request: request response: nil.
	WACurrentRequestContext use: requestContext during: [ 
		WACurrentLocalizationContext use: aLocalizationContext during: [ 
			requestContext push: handler during: [ 
					self assert: (aLocalizationContext firstSupportedLocaleWithFallback: [ WALocale fallbackLocale ]) localeId equals: 'en' ] ] ]