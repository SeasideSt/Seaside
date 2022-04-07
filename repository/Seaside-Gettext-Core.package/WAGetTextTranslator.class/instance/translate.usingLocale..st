translation
translate: aString usingLocale: aWALocale

	| result |
	result := moFiles at: aWALocale greaseString
		ifPresent: [ :mo | mo translationFor: aString ]
		ifAbsent: [ GetTextUnsucessfulTranslationResult original: aString ].

	"Sometimes locale have have names such as en-US but our locale is en, it then needs to ignore the country"
	^ (result isSuccessful not and: [ aWALocale country notNil ])
		  ifTrue: [ 
		  self translateIgnoringCountry: aString usingLocale: aWALocale ]
		  ifFalse: [ result translation ]