Class {
	#name : #WAHtmlFileHandlerListingTest,
	#superclass : #WAFileHandlerListingTest,
	#category : 'Seaside-Tests-Environment'
}

{ #category : #testing }
WAHtmlFileHandlerListingTest >> expectedMimeType [
	^ WAMimeType textHtml
]

{ #category : #testing }
WAHtmlFileHandlerListingTest >> handlerClass [
	^ WAHtmlFileHandlerListing
]
