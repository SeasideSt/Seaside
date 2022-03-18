public
translationFor: aString 

	aString size = 0 ifTrue: [
		"Gettext header"
		^ GetTextUnsucessfulTranslationResult original: aString translation: '' ]. 

	^ (self searchFor: aString) 
		ifNotNil: [ :aTranslation | GetTextSucessfulTranslationResult original: aString translation: aTranslation ]
		ifNil: [ GetTextUnsucessfulTranslationResult original: aString ]
