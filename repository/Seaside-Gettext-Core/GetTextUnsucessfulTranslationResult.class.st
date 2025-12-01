"
I'm an usuccessful translation result. As translation, I provide the origianl string.
"
Class {
	#name : 'GetTextUnsucessfulTranslationResult',
	#superclass : 'GetTextTranslationResult',
	#category : 'Seaside-Gettext-Core',
	#package : 'Seaside-Gettext-Core'
}

{ #category : 'accessing' }
GetTextUnsucessfulTranslationResult class >> original: originalString [

	^ self new 
		original: originalString;
		yourself
]

{ #category : 'accessing' }
GetTextUnsucessfulTranslationResult >> isSuccessful [

	^ false
]

{ #category : 'accessing' }
GetTextUnsucessfulTranslationResult >> translation [ 

	^ self original
]
