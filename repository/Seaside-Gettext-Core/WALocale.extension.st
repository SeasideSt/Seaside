Extension { #name : #WALocale }

{ #category : #'*seaside-gettext-core' }
WALocale >> asLocaleID [
	^ LocaleID
		isoLanguage: self language
		isoCountry: self country
]
