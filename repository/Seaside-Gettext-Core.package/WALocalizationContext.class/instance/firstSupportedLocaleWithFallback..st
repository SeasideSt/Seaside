accessing
firstSupportedLocaleWithFallback: aNiladicBlock
	"It gets complicated to test with request contexts (see WALocalizationContextTest>>testLocale as example)
	This helper method was made to be able to test the logic of the underlying locale selection strategy"
	| acceptLanguages |
	acceptLanguages := self requestContext request acceptLanguage.
	^ self firstSupportedLocaleForAcceptLanguages: acceptLanguages withFallback: aNiladicBlock.