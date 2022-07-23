*seaside-gettext-core
defaultLocale

	^ WACurrentLocalizationContext value 
		  firstSupportedLocaleWithFallback: [ WALocale fallbackLocale ]