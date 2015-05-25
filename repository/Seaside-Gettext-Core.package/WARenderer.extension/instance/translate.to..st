*seaside-gettext-core
translate: aString to: aLocale
	self text: (WACurrentLocalizationContext value translate: aString to: aLocale)