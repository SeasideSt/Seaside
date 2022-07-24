test
testTranslate

	| aLocalizationContext aLocale session request requestContext handler headers acceptLang |

	session := WASession new.
	aLocale := WALocale language: 'fr'.
	session locale: aLocale.
	handler := WAApplication new.
	handler configuration addParent: WAGetTextConfiguration instance.
	handler
		preferenceAt: #gettextApplicationName
		put: WAGettextExample getTextExampleApplicationName.

	request := WARequest method: 'GET' uri: '/'.
	requestContext := WARequestContext request: request response: nil.
	aLocalizationContext := WALocalizationContext new.

	"Case: no accept headers and no session"
	WACurrentRequestContext use: requestContext during: [ 
		WACurrentLocalizationContext use: aLocalizationContext during: [ 
			requestContext push: handler during: [ 
				self assert: (aLocalizationContext translate: 'fontsize') equals: 'fontsize' ] ] ].

	"Case: accept headers"
	headers := Dictionary new.
	acceptLang := 'nl-BE;q=1.0,fr;q=0.5'.
	headers at: 'accept-language' put: acceptLang.
	request setHeaders: headers.
	WACurrentRequestContext use: requestContext during: [ 
		WACurrentLocalizationContext use: aLocalizationContext during: [ 
			requestContext push: handler during: [ 
				self assert: (aLocalizationContext translate: 'fontsize') equals: 'schriftgrootte' ] ] ].
	
	"Case: session"
	WACurrentRequestContext use: requestContext during: [ 
		WACurrentLocalizationContext use: aLocalizationContext during: [ 
			requestContext push: handler during: [ 
				requestContext push: session during: [ 
					self assert: (aLocalizationContext translate: 'fontsize') equals: 'taille de police' ] ] ] ]
