"
A WAAccept is a WAQualifiedValue with a value that is an instance of WAMimeType. It represents how much a user agent prefers a certain mime type.
"
Class {
	#name : #WAAccept,
	#superclass : #WAQualifiedValue,
	#category : 'Seaside-Core-HTTP'
}

{ #category : #private }
WAAccept class >> valueClass [
	^ WAMimeType
]
