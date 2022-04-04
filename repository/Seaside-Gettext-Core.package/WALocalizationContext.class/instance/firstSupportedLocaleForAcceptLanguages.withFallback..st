accessing
firstSupportedLocaleForAcceptLanguages: acceptLanguages withFallback: aNiladicBlock

	| availableLanguageLocaleStrings |
	availableLanguageLocaleStrings := translator supportedLocaleStrings.
	acceptLanguages isNotNil ifTrue: [ 
		acceptLanguages do: [ :each | 
			| theLocale |
			theLocale := each value.
			"TODO: this should become a method perhaps. Maybe we want to ignore the country"
			(availableLanguageLocaleStrings includes: theLocale greaseString) 
				ifTrue: [ ^ theLocale ].
			theLocale country isNotNil ifTrue: [ 
				(availableLanguageLocaleStrings includes:
					 theLocale language , '-' , theLocale country asUppercase) 
					ifTrue: [ ^ theLocale ] ] ] ].
	^ aNiladicBlock value