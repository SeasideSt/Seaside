Extension { #name : #WARenderer }

{ #category : #'*seaside-gettext-core' }
WARenderer >> translate: aString [
	self text: (WACurrentLocalizationContext value translate: aString)
]

{ #category : #'*seaside-gettext-core' }
WARenderer >> translate: aString to: aLocale [
	self text: (WACurrentLocalizationContext value translate: aString to: aLocale)
]
