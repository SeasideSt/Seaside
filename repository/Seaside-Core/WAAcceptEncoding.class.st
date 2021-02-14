"
A WAAcceptCharset is a WAQualifiedValue with a value that is an instance of String. It represents how much a user agent prefers a certain encoding for the response.
"
Class {
	#name : #WAAcceptEncoding,
	#superclass : #WAQualifiedValue,
	#category : 'Seaside-Core-HTTP'
}

{ #category : #private }
WAAcceptEncoding class >> valueClass [
	^ String
]
