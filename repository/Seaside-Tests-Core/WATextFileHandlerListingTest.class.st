Class {
	#name : 'WATextFileHandlerListingTest',
	#superclass : 'WAFileHandlerListingTest',
	#category : 'Seaside-Tests-Core-Libraries',
	#package : 'Seaside-Tests-Core',
	#tag : 'Libraries'
}

{ #category : 'testing' }
WATextFileHandlerListingTest >> expectedMimeType [
	^ WAMimeType textPlain
]

{ #category : 'testing' }
WATextFileHandlerListingTest >> handlerClass [
	^ WATextFileHandlerListing
]
