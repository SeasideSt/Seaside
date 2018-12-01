Class {
	#name : #WATextFileHandlerListingTest,
	#superclass : #WAFileHandlerListingTest,
	#category : 'Seaside-Tests-Core-Libraries'
}

{ #category : #testing }
WATextFileHandlerListingTest >> expectedMimeType [
	^ WAMimeType textPlain
]

{ #category : #testing }
WATextFileHandlerListingTest >> handlerClass [
	^ WATextFileHandlerListing
]
