*seaside-gettext-core
defaultLocale

	^ WACurrentLocalizationContext value 
		  firstSupportedLocaleWithFallback: [ self fallbackLocale ]