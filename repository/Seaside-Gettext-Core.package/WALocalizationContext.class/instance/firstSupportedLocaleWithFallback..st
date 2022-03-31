accessing
firstSupportedLocaleWithFallback: aNiladicBlock
	| availableLanguageLocaleStrings acceptLanguages |
	availableLanguageLocaleStrings := translator supportedLocaleStrings.
	acceptLanguages := self requestContext request acceptLanguage.
	acceptLanguages isNotNil ifTrue: [ 
		acceptLanguages do: [ :each || theLocale |
		theLocale := each value.
		"TODO: this should become a method perhaps. Maybe we want to ignore the country"
		(availableLanguageLocaleStrings includes: theLocale greaseString) 
			ifTrue: [ ^ theLocale ].
		(availableLanguageLocaleStrings includes: (theLocale language),'-',(theLocale country asUppercase))
			ifTrue: [ ^ theLocale ] ] ].
	^ aNiladicBlock value