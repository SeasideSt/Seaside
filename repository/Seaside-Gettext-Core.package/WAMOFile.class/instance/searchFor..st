public
searchFor: aString
	| index |
	index := translations at: aString ifAbsent: [^nil].
	^translatedStrings at: index.
	
