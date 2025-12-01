"
A WALocalizationContextTest is a test class for testing the behavior of WALocalizationContext
"
Class {
	#name : 'WALocalizationContextTest',
	#superclass : 'TestCase',
	#category : 'Seaside-Tests-Gettext-Core',
	#package : 'Seaside-Tests-Gettext-Core'
}

{ #category : 'initialization' }
WALocalizationContextTest >> setUp [
	super setUp.
	[ WAGettextExample removeTranslatorForExample ] on: Error do:[ :e | ].
	WAGettextExample addTranslatorForExample.
]

{ #category : 'initialization' }
WALocalizationContextTest >> tearDown [
	[ WAGetTextTranslator removeTranslatorFor: WAGettextExample getTextExampleApplicationName ] on: Error do:[ :e | ].
	super tearDown.
]

{ #category : 'test' }
WALocalizationContextTest >> testFirstSupportedLocaleForAcceptLanguagesWithFallback [
  | aLocalizationContext acceptLanguages resultLocale |
  aLocalizationContext := WALocalizationContext new.
  aLocalizationContext
    instVarNamed: 'translator'
    put:
      (WAGetTextTranslator
        translatorFor: WAGettextExample getTextExampleApplicationName).
  acceptLanguages := WAAcceptLanguage fromString: 'nl-BE;q=1.0,fr;q=0.5'.
  resultLocale := aLocalizationContext
    firstSupportedLocaleForAcceptLanguages: acceptLanguages
    withFallback: [  ].
  self assert: resultLocale localeId equals: 'nl-BE'.
  acceptLanguages := WAAcceptLanguage fromString: 'ch-DE;q=1.0'.
  resultLocale := aLocalizationContext
    firstSupportedLocaleForAcceptLanguages: acceptLanguages
    withFallback: [  ].
  self assert: resultLocale isNil.
  resultLocale := aLocalizationContext
    firstSupportedLocaleForAcceptLanguages: acceptLanguages
    withFallback: [ WALocale language: 'en' ].
  self assert: resultLocale localeId equals: 'en'
]

{ #category : 'test' }
WALocalizationContextTest >> testFirstSupportedLocaleWithFallback [
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
]

{ #category : 'test' }
WALocalizationContextTest >> testLocale [

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
				aLocalizationContext translator.
				self assert: aLocalizationContext locale localeId equals: 'en' ] ] ].

	"Case: accept headers"
	headers := Dictionary new.
	acceptLang := 'nl-BE;q=1.0,fr;q=0.5'.
	headers at: 'accept-language' put: acceptLang.
	request setHeaders: headers.
	WACurrentRequestContext use: requestContext during: [ 
		WACurrentLocalizationContext use: aLocalizationContext during: [ 
			requestContext push: handler during: [ 
				self assert: aLocalizationContext locale localeId equals: 'nl-BE' ] ] ].

	"Case: session"
	WACurrentRequestContext use: requestContext during: [ 
		WACurrentLocalizationContext use: aLocalizationContext during: [ 
			requestContext push: handler during: [ 
				requestContext push: session during: [ 
					self assert: aLocalizationContext locale localeId equals: 'fr' ] ] ] ]
]

{ #category : 'test' }
WALocalizationContextTest >> testTranslate [

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
]
