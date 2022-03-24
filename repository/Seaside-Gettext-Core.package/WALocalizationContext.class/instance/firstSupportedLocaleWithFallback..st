accessing
firstSupportedLocaleWithFallback: aNiladicBlock
	| availableLanguageLocaleStrings |
	availableLanguageLocaleStrings := translator supportedLocaleStrings.
	self requestContext request acceptLanguage do: [ :each |
		| theLocale |
		theLocale := each value.
		(availableLanguageLocaleStrings includes: theLocale greaseString)
			ifTrue: [ ^ theLocale ] ].
	^ aNiladicBlock value