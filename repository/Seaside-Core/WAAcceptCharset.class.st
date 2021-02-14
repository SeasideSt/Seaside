"
A WAAcceptCharset is a WAQualifiedValue with a value that is an instance of String. It represents how much a user agent prefers a certain character set for the response.
"
Class {
	#name : #WAAcceptCharset,
	#superclass : #WAQualifiedValue,
	#category : 'Seaside-Core-HTTP'
}

{ #category : #private }
WAAcceptCharset class >> valueClass [
	^ String
]
