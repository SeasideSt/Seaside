Extension { #name : 'WASession' }

{ #category : '*seaside-gettext-core' }
WASession >> defaultLocale [

	^ WACurrentLocalizationContext value 
		  firstSupportedLocaleWithFallback: [ WALocale fallbackLocale ]
]

{ #category : '*seaside-gettext-core' }
WASession >> locale [

	^ self properties
		  at: #gettextLocale
		  ifAbsentPut: [ self defaultLocale ]
]

{ #category : '*seaside-gettext-core' }
WASession >> locale: aLocale [

	self properties at: #gettextLocale put: aLocale
]
