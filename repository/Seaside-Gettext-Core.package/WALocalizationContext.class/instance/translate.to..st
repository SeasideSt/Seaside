translating
translate: aString to: aLocale
	^ (WAGetTextTranslator availableForLocaleID: aLocale asLocaleID)
		translate: aString
		fromFiles: self languageFiles