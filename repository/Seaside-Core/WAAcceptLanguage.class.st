"
A WAAcceptLanguage is a WAQualifiedValue with a value that is an instance of WALocale. It represents how much a user agent prefers a certain locale.
"
Class {
	#name : #WAAcceptLanguage,
	#superclass : #WAQualifiedValue,
	#category : 'Seaside-Core-HTTP'
}

{ #category : #private }
WAAcceptLanguage class >> valueClass [
	^ WALocale
]
