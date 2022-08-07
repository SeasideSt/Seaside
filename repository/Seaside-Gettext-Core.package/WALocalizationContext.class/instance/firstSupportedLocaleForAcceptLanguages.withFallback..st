accessing
firstSupportedLocaleForAcceptLanguages: acceptLanguages withFallback: aNiladicBlock

	| availableLanguageLocaleIds |
	availableLanguageLocaleIds := self translator supportedLocaleIds.
	acceptLanguages ifNotNil: [ 
		acceptLanguages do: [ :each | 
			| theLocale |
			theLocale := each value.
			"TODO: this should become a method perhaps. Maybe we want to ignore the country"
			(availableLanguageLocaleIds includes: theLocale localeId) 
				ifTrue: [ ^ theLocale ].
			theLocale country ifNotNil: [ 
				(availableLanguageLocaleIds includes: (theLocale language , '-' , theLocale country))
					ifTrue: [ ^ theLocale ] ] ] ].
	^ aNiladicBlock value