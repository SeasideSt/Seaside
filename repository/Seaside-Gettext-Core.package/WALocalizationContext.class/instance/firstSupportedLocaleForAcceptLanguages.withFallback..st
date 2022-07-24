accessing
firstSupportedLocaleForAcceptLanguages: acceptLanguages withFallback: aNiladicBlock

	| availableLanguageLocaleIds |
	availableLanguageLocaleIds := self translator supportedLocaleIds.
	acceptLanguages isNotNil ifTrue: [ 
		acceptLanguages do: [ :each | 
			| theLocale |
			theLocale := each value.
			"TODO: this should become a method perhaps. Maybe we want to ignore the country"
			(availableLanguageLocaleIds includes: theLocale localeId) 
				ifTrue: [ ^ theLocale ].
			theLocale country isNotNil ifTrue: [ 
				(availableLanguageLocaleIds includes: (theLocale language , '-' , theLocale country))
					ifTrue: [ ^ theLocale ] ] ] ].
	^ aNiladicBlock value