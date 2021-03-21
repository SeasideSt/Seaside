accessing
availableLocales
	^ Array
		with: (WALocale language: 'en')
		with: (WALocale language: 'de' country: 'CH')
		with: (WALocale language: 'fr')
		with: (WALocale language: 'nl' country: 'BE')