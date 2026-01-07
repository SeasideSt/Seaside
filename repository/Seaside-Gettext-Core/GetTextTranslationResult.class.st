"
I am the translation result. I keep the original string, translation and information whether the tranlation was successful or not.
"
Class {
	#name : 'GetTextTranslationResult',
	#superclass : 'Object',
	#instVars : [
		'original',
		'translation'
	],
	#category : 'Seaside-Gettext-Core',
	#package : 'Seaside-Gettext-Core'
}

{ #category : 'as yet unclassified' }
GetTextTranslationResult class >> original: originalString translation: translatedString [

	^ self new 
		original: originalString;
		translation: translatedString;
		yourself
]

{ #category : 'accessing' }
GetTextTranslationResult >> isSuccessful [

	self subclassResponsibility
]

{ #category : 'accessing' }
GetTextTranslationResult >> original [
	^ original
]

{ #category : 'accessing' }
GetTextTranslationResult >> original: anObject [
	original := anObject
]

{ #category : 'accessing' }
GetTextTranslationResult >> translation [
	^ translation
]

{ #category : 'accessing' }
GetTextTranslationResult >> translation: anObject [
	translation := anObject
]
