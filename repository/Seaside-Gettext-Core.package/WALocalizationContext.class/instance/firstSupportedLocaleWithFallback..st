accessing
firstSupportedLocaleWithFallback: aNiladicBlock
	| availableLanguageLocaleIDs |
	availableLanguageLocaleIDs := GetTextTranslator availableLanguageLocaleIDs.
	self requestContext request acceptLanguage do: [ :each |
		| locale |
		locale := each value.
		(availableLanguageLocaleIDs includes: locale asLocaleID)
			ifTrue: [ ^ locale ] ].
	^ aNiladicBlock value