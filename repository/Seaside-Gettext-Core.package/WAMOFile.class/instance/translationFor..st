public
translationFor: aString 

	aString isEmpty ifTrue: [
		^ GetTextUnsucessfulTranslationResult original: aString translation: '' ].

	^ (self searchFor: aString) 
		ifNotNil: [ :aTranslation | GetTextSucessfulTranslationResult original: aString translation: aTranslation ]
		ifNil: [ GetTextUnsucessfulTranslationResult original: aString ]
