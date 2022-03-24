translation
translate: aString usingLocale: aWALocale
	| result |
	result := moFiles at: aWALocale greaseString 
	ifPresent: [ :mo | mo translationFor: aString ]
	ifAbsent: [ GetTextUnsucessfulTranslationResult original: aString ].

	^ (result isSuccessful not and: [ aWALocale country notNil ])
		ifTrue: [ self translateIgnoringCountry: aString usingLocale: aWALocale ]
		ifFalse: [ result translation ]