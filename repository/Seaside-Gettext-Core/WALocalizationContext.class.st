Class {
	#name : #WALocalizationContext,
	#superclass : #WAObject,
	#instVars : [
		'domain',
		'translator',
		'localeId'
	],
	#category : 'Seaside-Gettext-Core'
}

{ #category : #accessing }
WALocalizationContext >> defaultApplicationName [
	^ 'defaultApplication'
]

{ #category : #accessing }
WALocalizationContext >> domain [
	domain isNil ifTrue: [
		"determine the domain name
		1. try if it is configured on the application
		2. use the application name
		3. send #defaultApplicationName"
		| configuredDomain |
		configuredDomain := [ self application gettextDomain ]
			on: WAAttributeNotFound
			do: [ :error | nil ].
		domain := configuredDomain isEmptyOrNil
			ifFalse: [ configuredDomain ]
			ifTrue: [
				| applicationName |
				applicationName := self application name.
				applicationName isEmptyOrNil
					ifFalse: [ applicationName ]
					ifTrue: [ self defaultApplicationName ] ] ].
	^ domain
]

{ #category : #accessing }
WALocalizationContext >> firstSupportedLocaleWithFallback: aNiladicBlock [
	| availableLanguageLocaleIDs |
	availableLanguageLocaleIDs := GetTextTranslator availableLanguageLocaleIDs.
	self requestContext request acceptLanguage do: [ :each |
		| locale |
		locale := each value.
		(availableLanguageLocaleIDs includes: locale asLocaleID)
			ifTrue: [ ^ locale ] ].
	^ aNiladicBlock value
]

{ #category : #accessing }
WALocalizationContext >> fistSupportedLocaleWithFallback: aNiladicBlock [
	self greaseDeprecatedApi: 'WALocalizationContext>>#fistSupportedLocaleWithFallback:' details: 'Use #firstSupportedLocaleWithFallback: instead.'. 
	^ self firstSupportedLocaleWithFallback: aNiladicBlock
]

{ #category : #accessing }
WALocalizationContext >> localeId [
	localeId isNil ifTrue: [
		| session |
		session := self session.
		self session notNil
			ifTrue: [
				"if there's a session take it from the session"
				localeId := session locale asLocaleID ]
			ifFalse: [
				"do language negotiation and take the first supported one"
				self requestContext acceptLanguage do: [ :each |
					| candidate |
					candidate := each value asLocaleID.
					GetTextTranslator translators
						at: candidate
						ifPresent: [ :t |
							translator := t.
							^ localeId := candidate ] ].
				"fall back to default"
				translator := GetTextTranslator default.
				localeId := translator localeID ] ].
	^ localeId
]

{ #category : #translating }
WALocalizationContext >> translate: aString [
	^ self translator
		translate: aString
		inDomain: self domain
]

{ #category : #translating }
WALocalizationContext >> translate: aString to: aLocale [
	^ (GetTextTranslator availableForLocaleID: aLocale asLocaleID)
		translate: aString
		inDomain: self domain
]

{ #category : #accessing }
WALocalizationContext >> translator [
	translator isNil ifTrue: [
		translator := GetTextTranslator availableForLocaleID: self localeId ].
	^ translator
]
