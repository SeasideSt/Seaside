Extension { #name : #String }

{ #category : #'*seaside-gettext-core' }
String >> seasideLazyTranslated [
	^ WALazyTranslatedString key: self
]

{ #category : #'*seaside-gettext-core' }
String >> seasideTranslated [
	^ WACurrentLocalizationContext value translate: self
]

{ #category : #'*seaside-gettext-core' }
String >> seasideTranslatedTo: aLocale [
	^ WACurrentLocalizationContext value translate: self to: aLocale
]
