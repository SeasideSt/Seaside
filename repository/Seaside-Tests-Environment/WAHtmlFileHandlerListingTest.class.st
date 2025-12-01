Class {
	#name : 'WAHtmlFileHandlerListingTest',
	#superclass : 'WAFileHandlerListingTest',
	#category : 'Seaside-Tests-Environment-Base',
	#package : 'Seaside-Tests-Environment',
	#tag : 'Base'
}

{ #category : 'testing' }
WAHtmlFileHandlerListingTest >> expectedMimeType [
	^ WAMimeType textHtml
]

{ #category : 'testing' }
WAHtmlFileHandlerListingTest >> handlerClass [
	^ WAHtmlFileHandlerListing
]
