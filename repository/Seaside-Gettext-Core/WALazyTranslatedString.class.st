Class {
	#name : #WALazyTranslatedString,
	#superclass : #WAObject,
	#instVars : [
		'key'
	],
	#category : 'Seaside-Gettext-Core'
}

{ #category : #'instance creation' }
WALazyTranslatedString class >> key: aString [
	^ self basicNew initializeWithKey: aString
]

{ #category : #initialization }
WALazyTranslatedString >> initializeWithKey: aString [
	self initialize.
	key := aString
]

{ #category : #initialization }
WALazyTranslatedString >> key [
	^ key
]

{ #category : #printing }
WALazyTranslatedString >> printOn: aStream [
	key seasideTranslated printOn: aStream
]

{ #category : #rendering }
WALazyTranslatedString >> renderOn: html [
	html translate: key
]
