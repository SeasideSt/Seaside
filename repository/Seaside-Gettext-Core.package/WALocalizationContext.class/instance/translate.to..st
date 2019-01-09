translating
translate: aString to: aLocale
	^ (GetTextTranslator availableForLocaleID: aLocale asLocaleID)
		translate: aString
		inDomain: self domain