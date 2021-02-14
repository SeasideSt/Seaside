Extension { #name : #WASession }

{ #category : #'*seaside-gettext-core' }
WASession >> defaultLocale [
	^ WACurrentLocalizationContext value
		firstSupportedLocaleWithFallback:  [ self fallbackLocale ]
]

{ #category : #'*seaside-gettext-core' }
WASession >> fallbackLocale [
	^ WALocale
		language: 'en'
]

{ #category : #'*seaside-gettext-core' }
WASession >> locale [
	^ self properties
		at: #gettextLocale
		ifAbsentPut: [ self defaultLocale ]
]

{ #category : #'*seaside-gettext-core' }
WASession >> locale: aLocale [
	self properties
		at: #gettextLocale
		put: aLocale
]
